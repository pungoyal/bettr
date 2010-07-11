require 'spec_helper'

describe Match do
  before(:all) { @match = Factory(:match) }

  it { should belong_to(:winner) }
  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:teams) }

  it "should ensure exactly two teams are involved in a match" do
    @match.valid?.should == true

    @match.teams << Factory(:team)
    @match.valid?.should == false
    @match.errors['teams'].count.should == 1
    assert_equal 'has 2 teams', @match.errors['teams'].first
  end

  after(:all) { @match.destroy }
end
