require 'spec_helper'

describe "teams/index.html.haml" do
  before(:each) do
    assign(:teams, [
      stub_model(Team,
        :name => "Name",
        :code => "Code"
      ),
      stub_model(Team,
        :name => "Name",
        :code => "Code"
      )
    ])
  end

  it "renders a list of teams" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Code".to_s, :count => 2)
  end
end
