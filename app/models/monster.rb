class Monster
  include Mongoid::Document
  field :name, type: String
  field :drops, type: String
  field :hp, type: Integer, default: 100 
  field :mana, type: Integer, default: 50
  field :maxhp, type: Integer
  field :maxmana, type: Integer
  field :damage, type: Integer
  field :force, type: Integer
  field :ac, type: Integer
  field :mr, type: Integer
  field :level, type: Integer
  field :base_exp, type: Integer
  embeds_many :items
  embedded_in :fights
  validates_numericality_of :level
  validates_presence_of :name, :level
  validates_uniqueness_of :name
  validates_format_of :name, with: /\A(\w|\s)+\z/
  after_create :randomize_level
  def randomize_level
    level_rand = rand(1..3)
    if level_rand == 1
      self.level -= 1
    elsif level_rand == 2
      self.level += 1
    end
  end
  def give_item(item)
    self.items.create(name: item.name, damage: item.damage, ac: item.ac, price: item.price, bonus: item.bonus, quality: item.quality, equipment_type: item.equipment_type)
  end

  def take_item(item_id)
    self.items.find(item_id).destroy if item_id
  end

end
