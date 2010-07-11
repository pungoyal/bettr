require 'spec_helper'

describe "bets/edit.html.haml" do
  before(:each) do
    @bet = assign(:bet, stub_model(Bet,
      :new_record? => false,
      :points => 1,
      :success => false
    ))
  end

  it "renders the edit bet form" do
    render

    rendered.should have_selector("form", :action => bet_path(@bet), :method => "post") do |form|
      form.should have_selector("input#bet_points", :name => "bet[points]")
      form.should have_selector("input#bet_success", :name => "bet[success]")
    end
  end
end
