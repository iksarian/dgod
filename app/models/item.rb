class Item
  include Mongoid::Document
  field :name, type: String
  field :damage, type: Integer
  field :mf, type: Integer
  field :ac, type: Integer
  field :mr, type: Integer
  field :price, type: Integer
  field :bonus
  field :classes, type: Array, default: []
  field :quality, type: String
  field :equipment_type, type: String
  embedded_in :merchant
  embedded_in :user
  embedded_in :character
  embedded_in :monster
  embedded_in :global_monster
  validates_numericality_of :damage, :ac, :price
  validates_length_of :name, minimum: 1, maximum: 255
  validates_presence_of :name, :damage, :ac, :price, :quality, :equipment_type

  def is_equipped?
    if self.character
      if self.equipment_type == "Helm"
        if self.character.helm_id == self.id
          return true
        else
          return false
        end
      elsif self.equipment_type == "Armor"
        if self.character.armor_id == self.id
          return true
        else
          return false
        end
      elsif self.equipment_type == "Weapon"
        if self.character.weapon_id == self.id
          return true
        else
          return false
        end
      elsif self.equipment_type == "Accessory"
        if self.character.accessory_id == self.id
          return true
        else
          return false
        end
      end
    end
  end
end
