require 'spec_helper'

describe User do
  before(:all) { @user = Factory(:user) }

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }

  it { should have_many(:bets) }

  it "should be able to place a bet" do
    match = Factory(:match)
    team = match.teams[0]

    initial_points = @user.points
    points_to_bet = 20
    @user.place_bet match, team, points_to_bet

    @user.points.should == initial_points - points_to_bet
  end

  it "can place multiple bets on a match" do
    match = Factory(:match)
    team = match.teams[0]
    initial_points = @user.points

    bets = Bet.find_all_by_user_id_and_match_id(@user, match)
    bets.size.should == 0

    @user.place_bet match, team, 20
    bets = Bet.find_all_by_user_id_and_match_id(@user, match)
    bets.size.should == 1
    bets[0].points.should == 20

    @user.place_bet match, team, 30
    bets = Bet.find_all_by_user_id_and_match_id(@user, match)
    bets.size.should == 1
    bets[0].points.should == 50

    @user.points.should == initial_points-50
  end

  it "should be able to sum points in placed bets" do
    match = Factory(:match)
    another_match = Factory(:match)
    Bet.create! :user => @user, :points => 19, :match => match, :team => match.teams[0]
    Bet.create! :user => @user, :points => 31, :match => another_match, :team => another_match.teams[0]
    @user.bets.size.should == 2
    @user.placed_bets_points.should == 50
  end

  it "can be awarded a certain number of points" do
    initial_points = @user.points
    @user.award 100
    @user.points.should == initial_points + 100
  end

  after(:all) { @user.destroy }
end
