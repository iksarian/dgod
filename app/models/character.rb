class Character
  include Mongoid::Document
  field :name, type: String
  field :level, type: Integer
  field :hp, type: Integer
  field :mana, type: Integer
  field :gold, type: Integer
  belongs_to :user
  def user
    User.find(self.user_id)
  end
end
