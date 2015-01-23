class Merchant
  include Mongoid::Document
  field :name, type: String
  field :quality, type: String
  field :add_item
  embeds_many :items
  validates_presence_of :name, :quality
  validates_length_of :name, minimum: 1, maximum: 22
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w|\s)+\z/

  def give_item(item)
    self.items.create(name: item.name, damage: item.damage, ac: item.ac, price: item.price, bonus: item.bonus, quality: item.quality, equipment_type: item.equipment_type)
  end


end
