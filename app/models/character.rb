class Character
  include Mongoid::Document
  field :name, type: String
  field :level, type: Integer, default: 1
  field :hp, type: Integer, default: 100
  field :mana, type: Integer, default: 50
  field :maxhp, type: Integer, default: 100
  field :maxmana, type: Integer
  field :attack_dmg, type: Integer, default: 2
  field :magic_force, type: Integer, default: 0
  field :armor_class, type: Integer, default: 0
  field :magic_resist, type: Integer, default: 0
  field :strength, type: Integer
  field :constitution, type: Integer
  field :dexterity, type: Integer
  field :intelligence, type: Integer
  field :speed, type: Integer
  field :weapon_id
  field :helm_id
  field :armor_id
  field :accessory_id
  has_and_belongs_to_many :fights
  belongs_to :user
  belongs_to :profession
  embeds_many :items
  validates_length_of :name, minimum: 1, maximum: 16
  validates_numericality_of :level, :hp, :mana
  validates_presence_of :name, :hp, :mana, :level
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w|\s)+\z/
  def user
    User.find(self.user_id)
  end
  def profession
    Profession.find(self.profession_id) if self.profession_id
  end
  def helm
    self.items.find(self.helm_id) if self.helm_id
  end
  def weapon
    self.items.find(self.weapon_id) if self.weapon_id
  end
  def armor
    self.items.find(self.armor_id) if self.armor_id
  end
  def accessory
    self.items.find(self.accessory_id) if self.accessory_id
  end
  def give_item(item)
    self.items.create(name: item.name, damage: item.damage, mf: item.mf, ac: item.ac, mr: item.mr, price: item.price, bonus: item.bonus, classes: item.classes, quality: item.quality, equipment_type: item.equipment_type)
    item.destroy
  end
  def take_item(item)
    self.user.items.create(name: item.name, damage: item.damage, mf: item.mf, ac: item.ac, mr: item.mr, price: item.price, bonus: item.bonus, classes: item.classes, quality: item.quality, equipment_type: item.equipment_type)

    item.destroy
  end
  def equip_item(item)
    if item.classes.include?(self.profession_id.to_s)
      if item.equipment_type == "Helm"
        self.armor_class -= self.helm.ac if self.helm
        self.magic_resist -= self.helm.mr if self.helm
        self.attack_dmg -= self.helm.damage if self.helm
        self.magic_force -= self.helm.mf if self.helm
        self.helm_id = nil
        self.helm_id = item.id
        self.armor_class += item.ac
        self.magic_resist += item.mr
        self.magic_force += item.mf
        self.attack_dmg += item.damage
        self.save
      elsif item.equipment_type == "Armor"
        self.armor_class -= self.armor.ac if self.armor
        self.magic_resist -= self.armor.mr if self.armor
        self.attack_dmg -= self.armor.damage if self.armor
        self.magic_force -= self.armor.mf if self.armor
        self.armor_id = nil
        self.armor_id = item.id
        self.armor_class += item.ac
        self.magic_resist += item.mr
        self.magic_force += item.mf
        self.attack_dmg += item.damage
        self.save
      elsif item.equipment_type == "Weapon"
        self.attack_dmg -= self.weapon.damage if self.weapon
        self.magic_force -= self.weapon.mf if self.weapon
        self.armor_class -= self.weapon.ac if self.weapon
        self.magic_resist -= self.weapon.mr if self.weapon
        self.weapon_id = nil
        self.weapon_id = item.id
        self.attack_dmg += item.damage
        self.magic_force += item.mf
        self.armor_class += item.ac
        self.magic_resist += item.mr
        self.save
      elsif item.equipment_type == "Accessory"
        self.armor_class -= self.accessory.ac if self.accessory
        self.magic_resist -= self.accessory.mr if self.accessory
        self.attack_dmg -= self.accessory.damage if self.accessory
        self.magic_force -= self.accessory.mf if self.accessory
        self.accessory_id = nil
        self.accessory_id = item.id
        self.armor_class += item.ac
        self.magic_resist += item.ac
        self.attack_dmg += item.damage
        self.magic_force += item.mf
        self.save
      else
        return false
      end
    else
      return false
    end
  end
  def unequip_item(item)
    if item.equipment_type == "Helm"
      self.helm_id = nil
      self.armor_class -= item.ac
      self.attack_dmg -= item.damage
      self.magic_force -= item.mf
      self.magic_resist -= item.mr
    elsif item.equipment_type == "Armor"
      self.armor_id = nil
      self.armor_class -= item.ac
      self.attack_dmg -= item.damage
      self.magic_force -= item.mf
      self.magic_resist -= item.mr
    elsif item.equipment_type == "Weapon"
      self.weapon_id = nil
      self.attack_dmg -= item.damage
      self.armor_class -= item.ac
      self.magic_force -= item.mf
      self.magic_resist -= item.mr
    elsif item.equipment_type == "Accessory"
      self.accessory_id = nil
      self.armor_class -= item.ac
      self.attack_dmg -= item.damage
      self.magic_force -= item.mf
      self.magic_resist -= item.mr
    else
      return false
    end
    self.save
  end
end
