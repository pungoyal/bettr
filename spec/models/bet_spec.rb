require 'spec_helper'

describe Bet do
  before(:all) { @bet = Factory(:bet) }

  describe "should validate" do
    it "presence of match and participation of the team in the match" do
      match = Factory(:match)
      bet = Bet.new :user => User.new, :points => 20, :match => match

      bet.valid?.should == false
      bet.errors['team'].size.should == 2
      bet.errors['team'][0].should == "can't be blank"
      bet.errors['team'][1].should == "should be playing the match"

      bet.team = match.teams[0]
      bet.valid?.should == true
    end

    it "presence of points" do
      match = Factory(:match)
      bet = Bet.new :match => match, :user => User.new, :team => match.teams[0]

      bet.valid?.should == false
      bet.errors['points'].size.should == 1
      bet.errors['points'].first.should == "can't be blank"

      bet.points = 100
      bet.valid?.should == true
    end
    it "presence of user" do
      match = Factory(:match)
      bet = Bet.new :match => match, :points => 20, :team => match.teams[0]

      bet.valid?.should == false
      bet.errors['user'].size.should == 1
      bet.errors['user'].first.should == "can't be blank"

      bet.user = Factory.build(:user)
      bet.valid?.should == true
    end
  end

  describe "associations" do
    it { should belong_to(:match) }
    it { should belong_to(:team) }
    it { should belong_to(:user) }
  end

  it "can be won" do
    bet = Factory(:bet)
    initial_points = bet.user.points
    bet.won 10
    bet.success.should == true
    bet.user.points.should == initial_points + 10
  end

  it "can be lost" do
    bet = Factory(:bet)
    bet.lost
    bet.success.should == false
  end

  after(:all) { @bet.destroy }
end
