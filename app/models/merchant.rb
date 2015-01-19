class Merchant
  include Mongoid::Document
  field :name, type: String
  field :quality, type: String
end
