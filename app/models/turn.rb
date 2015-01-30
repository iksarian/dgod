class Turn
  include Mongoid::Document
  field :turn_count, type: Integer
  field :performer_id, type: String
  field :target_id, type: String
  field :action_type, type: String
  field :action_effect, type: Integer
  embedded_in :fight

  def performer
    if self.fight.monster.id.to_s == self.performer_id
      return self.fight.monster
    else
     Character.find(self.performer_id)
    end
  end
  def target
    if self.fight.monster.id.to_s == self.target_id
      return self.fight.monster
    else
     Character.find(self.target_id)
    end
  end
end
