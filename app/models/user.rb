class User < ActiveRecord::Base
  has_many :bets
  validates_uniqueness_of :email

  def placed_bets_points
    bets.sum :points
  end

  def award points
    self.points += points
    save!
  end

  def place_bet match, team, points_to_bet
    raise "Invalid Bet" if points - points_to_bet < 0

    already_existing_bet = bets.find_by_match_id(match)
    if already_existing_bet.nil?
      bets << Bet.new(:match => match, :points => points_to_bet, :team => team)
    else
      already_existing_bet.points += points_to_bet
      already_existing_bet.save!
    end
    self.points -= points_to_bet
    save!
  end
end
