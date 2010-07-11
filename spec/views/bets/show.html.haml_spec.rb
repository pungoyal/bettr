require 'spec_helper'

describe "bets/show.html.haml" do
  before(:each) do
    @bet = assign(:bet, stub_model(Bet,
      :points => 1,
      :success => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(false.to_s)
  end
end
