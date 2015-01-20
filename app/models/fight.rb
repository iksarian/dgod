class Fight
  include Mongoid::Document
  field :fight_over, type: Boolean
  field :turn_count, type: Integer
  field :exp_gain, type: Integer
end
