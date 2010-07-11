Factory.define :match do |match|
  match.after_build do |m|
    m.teams << Factory.create(:team)
    m.teams << Factory.create(:team)
  end
end

Factory.define :decided_match do |match|
  match.after_build do |m|
    winner = Factory.create(:team)
    m.teams << winner
    m.teams << Factory.create(:team)
    m.winner = winner
  end
end
