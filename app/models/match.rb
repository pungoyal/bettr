class Match < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :bets
  belongs_to :winner, :class_name => 'Team'

  validates_length_of :teams, :is => 2, :message => "has 2 teams"

  def won_by team
    raise "Invalid Winner" if !teams.include? team
    self.winner = team

    winning_bets = bets.select { |b| b.team == winner }
    losing_bets = bets.select { |b| b.team != winner }

#    combine into one?
    lost_points = 0
    losing_bets.each { |b| lost_points += b.points }

    winning_points = winning_bets.collect { |b| b.points }
    won_points = winning_points.collect { |i| (i * lost_points)/winning_points.sum }

    winning_bets.each_with_index { |bet, i| bet.won won_points[i] }
    losing_bets.each { |b| b.lost }
    save!
  end

  def to_s
    "#{teams[0].username} v/s #{teams[1].username}"
  end
end
