require 'spec_helper'

describe "bets/index.html.haml" do
  before(:each) do
    assign(:bets, [
      stub_model(Bet,
        :points => 1,
        :success => false
      ),
      stub_model(Bet,
        :points => 1,
        :success => false
      )
    ])
  end

  it "renders a list of bets" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
