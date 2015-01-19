class Monster
  include Mongoid::Document
  field :name, type: String
  field :drops, type: Array
  field :stats, type: Integer
  field :level, type: Integer
end
