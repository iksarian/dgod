class Profession
  include Mongoid::Document
  field :title, type: String
  field :stats, type: Integer
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_format_of :title, with: /\A\w+\z/
end
