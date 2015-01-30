class Fight
  include Mongoid::Document
  field :fight_over, type: Boolean, default: false
  field :turn_count, type: Integer, default: 0
  field :exp_gain, type: Integer
  field :character_id
  field :win, type: Boolean, default: false
  field :loss, type: Boolean, default: false
  embeds_one :monster
  embeds_many :turns
  belongs_to :user

  def character
    Character.find(self.character_id) if self.character_id
  end
  def user
    User.find(self.user_id)
  end
  def monster_turn
    character = self.character
    character.hp -= self.monster.damage
    self.turn_count += 1
    self.turns.create(turn_count: self.turn_count, action_effect: self.monster.damage, performer_id: self.monster.id, target_id: self.character.id, action_type: "attack")
    if character.hp <= 0
       self.fight_over = true
       self.loss = true
       character.hp = character.maxhp
    elsif self.monster.hp <= 0
      self.fight_over = true
      self.win = true
      character.hp = character.maxhp
    end
    character.save
    self.save
  end
  def attack
    character = self.character
    if self.fight_over == false
      self.monster.hp -= character.attack_dmg
      self.turn_count += 1
      self.turns.create(turn_count: self.turn_count, action_effect: self.character.attack_dmg, performer_id: self.character.id, target_id: self.monster.id, action_type: "attack")
      if character.hp <= 0
        self.fight_over = true
        self.loss = true
        character.hp = character.maxhp
      elsif self.monster.hp <= 0
        self.fight_over = true
        self.win = true
        character.hp = character.maxhp
      end
      self.save
      self.monster_turn
    end
  end
  def create_new_fight(character, monster)
    self.character_id = character.id
    self.create_monster(name: monster.name, damage: monster.damage, force: monster.force, ac: monster.ac, mr: monster.mr, level: monster.level, base_exp: monster.base_exp)
    self.save
  end

end
