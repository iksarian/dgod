json.array!(@global_monsters) do |global_monster|
  json.extract! global_monster, :id, :name, :drops, :damage, :force, :ac, :mr, :level, :base_exp
  json.url global_monster_url(global_monster, format: :json)
end
