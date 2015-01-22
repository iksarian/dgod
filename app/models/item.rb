class Item
  include Mongoid::Document
  field :name, type: String
  field :damage, type: Integer
  field :ac, type: Integer
  field :price, type: Integer
  field :bonus, type: Hash
  field :quality, type: String
  field :equipment_type, type: String
  embedded_in :merchant
  embedded_in :user
  embedded_in :character
  embedded_in :monster
  validates_numericality_of :damage, :ac, :price
  validates_length_of :name, minimum: 1, maximum: 20
  validates_presence_of :name, :damage, :ac, :price, :quality

  def is_equipped?
    if self.character
      puts "character exists"
      if self.equipment_type == "Helm"
        puts self.character.helm_id
        puts self.id
        if self.character.helm_id == self.id
          return true
        else
          return false
        end
      elsif self.equipment_type == "Armor"
        puts "is armor"
        if self.character.armor_id == self.id
          return true
        else
          return false
        end
      elsif self.equipment_type == "Weapon"
        puts "is weapon"
        puts self.character.weapon_id
        puts self.id
        if self.character.weapon_id == self.id
          return true
        else
          return false
        end
      else
        puts "is not anything"
      end
    end
  end
end
