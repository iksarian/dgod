class GlobalMonster
  include Mongoid::Document
  field :name, type: String
  field :hp, type: Integer
  field :mana, type: Integer
  field :maxhp, type: Integer
  field :maxmana, type: Integer
  field :damage, type: Integer, default: 0
  field :force, type: Integer, default: 0
  field :ac, type: Integer, default: 0
  field :mr, type: Integer, default: 0
  field :level, type: Integer, default: 1
  field :base_exp, type: Integer
  field :gold, type: Integer
  attr_accessor :drops
  has_and_belongs_to_many :fights
  embeds_many :items
  validates_numericality_of :level
  validates_presence_of :name, :level
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w|\s)+\z/

  def give_item(item)
    self.items.create(name: item.name, damage: item.damage, ac: item.ac, price: item.price, bonus: item.bonus, quality: item.quality, equipment_type: item.equipment_type)
  end

  def take_item(item_id)
    self.items.find(item_id).destroy if item_id
  end

end
