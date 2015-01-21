class Monster
  include Mongoid::Document
  field :name, type: String
  field :drops, type: String
  field :stats, type: Integer
  field :level, type: Integer
  validates_numericality_of :level
  validates_presence_of :name, :drops, :stats, :level
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A\w+\z/

end
