class GlobalItem
  include Mongoid::Document
  field :name, type: String
  field :damage, type: Integer
  field :ac, type: Integer
  field :price, type: Integer
  field :bonus, type: String
  field :quality, type: String
  field :equipment_type, type: String
end
