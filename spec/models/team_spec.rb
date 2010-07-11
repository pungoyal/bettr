require 'spec_helper'

describe Team do
  before(:all) { @team = Factory(:team) }

  it { should validate_presence_of :code }
  it { should validate_uniqueness_of :code }

  it { should have_many(:bets) }
  it { should have_and_belong_to_many(:matches) }

  it "should generate path to the flag image" do
    @team.flag_url.should == 'flags/' + @team.code + '.png'
  end

  after(:all) { @team.destroy }
end
