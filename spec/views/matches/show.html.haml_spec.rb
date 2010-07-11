require 'spec_helper'

describe "matches/show.html.haml" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Description".to_s)
  end
end
