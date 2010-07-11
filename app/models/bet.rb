class Bet < ActiveRecord::Base
  belongs_to :match
  belongs_to :team
  belongs_to :user

  validates_presence_of :match, :points, :team, :user
  validate :team_is_participating_in_the_match?

  def won points
    self.success = true
    user.award points
    save!
  end

  def lost
    self.success = false
    save!
  end

  private
  def team_is_participating_in_the_match?
    if !match.teams.include? team
      errors.add(:team, "should be playing the match")
    end
  end
end
