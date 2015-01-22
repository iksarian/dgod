class Merchant
  include Mongoid::Document
  field :name, type: String
  field :quality, type: String
  embeds_many :items
  validates_presence_of :name, :quality
  validates_length_of :name, minimum: 1, maximum: 22
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w|\s)+\z/

end
