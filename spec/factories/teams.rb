Factory.sequence :code do |n|
  "CO#{n}"
end

Factory.define :team do |team|
  team.name { 'Team' }
  team.code { Factory.next :code }
end
