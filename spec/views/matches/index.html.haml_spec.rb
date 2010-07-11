require 'spec_helper'

describe "matches/index.html.haml" do
  before(:each) do
    assign(:matches, [
      stub_model(Match,
        :description => "Description"
      ),
      stub_model(Match,
        :description => "Description"
      )
    ])
  end

  it "renders a list of matches" do
    render
    rendered.should have_selector("tr>td", :content => "Description".to_s, :count => 2)
  end
end
