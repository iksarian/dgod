class Monster
  include Mongoid::Document
  field :name, type: String
  field :drops, type: String
  field :stats, type: Integer
  field :level, type: Integer
  embeds_many :items
  validates_numericality_of :level
  validates_presence_of :name, :drops, :stats, :level
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w|\s)+\z/

  def give_item(item)
    self.items.create(name: item.name, damage: item.damage, ac: item.ac, price: item.price, bonus: item.bonus, quality: item.quality, equipment_type: item.equipment_type)
  end

  def take_item(item_id)
    self.items.find(item_id).destroy if item_id
  end

end
