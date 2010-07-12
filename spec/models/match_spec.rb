require 'spec_helper'

describe Match do
  before(:all) { @match = Factory(:match) }

  it { should belong_to(:winner) }
  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:teams) }

  it "should ensure exactly two teams are involved in a match" do
    match = Match.new

    match.teams << Team.new
    match.teams.size.should == 1
    match.valid?.should == false
    match.errors['teams'].count.should == 1
    assert_equal 'has 2 teams', match.errors['teams'].first

    match.teams << Team.new
    match.teams.size.should == 2
    match.valid?.should == true

    match.teams << Team.new
    match.teams.size.should == 3
    match.valid?.should == false
    match.errors['teams'].count.should == 1
    assert_equal 'has 2 teams', match.errors['teams'].first
  end

  it "has one of the participating teams as the winner"
  it "decision updates user points and bets"
  it "cannot be decided twice"

  after(:all) { @match.destroy }
end
