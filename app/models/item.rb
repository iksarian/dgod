class Item
  include Mongoid::Document
  field :name, type: String
  field :damage, type: Integer
  field :ac, type: Integer
  field :price, type: Integer
  field :bonus, type: Hash
  field :quality, type: String
  embedded_in :merchant
  embedded_in :user
  validates_numericality_of :damage, :ac, :price
  validates_length_of :name, minimum: 1, maximum: 20
  validates_presence_of :name, :damage, :ac, :price, :quality
end
