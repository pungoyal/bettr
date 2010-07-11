Factory.define :bet do |bet|
  bet.association :user
  bet.association :match
  bet.points { 10 }
  bet.after_build do |b|
    b.team = b.match.teams[0]
  end
end
