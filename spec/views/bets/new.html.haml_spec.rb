require 'spec_helper'

describe "bets/new.html.haml" do
  before(:each) do
    assign(:bet, stub_model(Bet,
      :new_record? => true,
      :points => 1,
      :success => false
    ))
  end

  it "renders new bet form" do
    render

    rendered.should have_selector("form", :action => bets_path, :method => "post") do |form|
      form.should have_selector("input#bet_points", :name => "bet[points]")
      form.should have_selector("input#bet_success", :name => "bet[success]")
    end
  end
end
