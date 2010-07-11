require 'spec_helper'

describe Team do
  before(:all) { Team.create! :code => 'BRA', :name => 'Brazil' }

  it { should validate_presence_of :code }
  it { should validate_uniqueness_of :code }

  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:matches) }

  it "should generate path to the flag image" do
    Team.first.flag_url.should == 'flags/BRA.png'
  end
end
