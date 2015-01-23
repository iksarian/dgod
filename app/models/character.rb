class Character
  include Mongoid::Document
  field :name, type: String
  field :level, type: Integer, default: 1
  field :hp, type: Integer, default: 100
  field :mana, type: Integer, default: 50
  field :weapon_id
  field :helm_id
  field :armor_id
  field :accessory_id
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
    self.items.create(name: item.name, damage: item.damage, ac: item.ac, price: item.price, bonus: item.bonus, quality: item.quality, equipment_type: item.equipment_type)
    item.destroy
  end
  def take_item(item)
    self.user.items.create(name: item.name, damage: item.damage, ac: item.ac, price: item.price, bonus: item.bonus, quality: item.quality, equipment_type: item.equipment_type)

    item.destroy
  end
  def equip_item(item)
    if item.equipment_type == "Helm"
      self.helm_id = item.id
      self.save
    elsif item.equipment_type == "Armor"
      self.armor_id = item.id
      self.save
    elsif item.equipment_type == "Weapon"
      self.weapon_id = item.id
      self.save
    elsif item.equipment_type == "Accessory"
      self.accessory_id = item.id
      self.save
    else
      return false
    end
  end
  def unequip_item(item)
   if item.equipment_type == "Helm"
     self.helm_id = nil
   elsif item.equipment_type == "Armor"
     self.armor_id = nil
   elsif item.equipment_type == "Weapon"
     self.weapon_id = nil
   elsif item.equipment_type == "Accessory"
     self.accessory_id = nil
     self.save
   else
     return false
   end
   self.save
  end
end
