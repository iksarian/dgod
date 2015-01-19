class Ability
  include Mongoid::Document
  field :mpcost, type: Integer
  field :hpcost, type: Integer
  field :description, type: String
end
