class Profession
  include Mongoid::Document
  field :title, type: String
  field :stats, type: Integer
end
