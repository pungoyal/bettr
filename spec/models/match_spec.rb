require 'spec_helper'

describe Match do
  before(:each) { @match = Factory(:match) }

  it { should belong_to(:winner) }
  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:teams) }

  it "should ensure exactly two teams are involved in a @match" do
    @match.valid?.should == true

    @match.teams << Factory.build(:team)
    @match.valid?.should == false
    @match.errors['teams'].count.should == 1
    @match.errors['teams'].first.should == 'has 2 teams'

    @match.teams.pop
    @match.teams.pop
    @match.valid?.should == false
    @match.errors['teams'].count.should == 1
    @match.errors['teams'].first.should == 'has 2 teams'
  end

  it "has one of the participating teams as the winner" do
    winner = @match.teams[0]
    random_team = Factory :team

    assert_raise(RuntimeError) { @match.won_by random_team }

    @match.won_by winner
    @match.winner.should == winner
  end

  it "decision updates user points and bets" do
    winner_team = @match.teams[0]
    loser_team = @match.teams[1]
    winner = Factory(:user)
    loser = Factory(:user)
    Bet.create! :match => @match, :team => winner_team, :user => winner, :points => 20
    Bet.create! :match => @match, :team => loser_team, :user => loser, :points => 20

    winners_points = winner.points
    losers_points = loser.points

    @match.won_by winner_team
    decided_bets = @match.bets
    decided_bets.size.should == 2
    decided_bets[0].success.should == true
    decided_bets[1].success.should == false

    winner.reload
    loser.points.should == losers_points
    winner.points.should == winners_points + 20
  end

  it "cannot be decided twice" do
    pending ("feature is yet to be implemented")
    winner_team = @match.teams[0]
    loser_team = @match.teams[1]
    @match.won_by winner_team
    @match.won_by loser_team
    assert false
  end

  after(:each) { @match.destroy }
end
