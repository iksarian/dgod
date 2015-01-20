class Character
  include Mongoid::Document
  field :name, type: String
  field :level, type: Integer, default: 1
  field :hp, type: Integer, default: 100
  field :mana, type: Integer, default: 50
  field :gold, type: Integer, default: 10
  belongs_to :user
  belongs_to :profession
  def user
    User.find(self.user_id)
  end
  def profession
    Profession.find(self.profession_id)
  end
end
