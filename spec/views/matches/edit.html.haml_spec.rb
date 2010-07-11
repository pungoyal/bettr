require 'spec_helper'

describe "matches/edit.html.haml" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :new_record? => false,
      :description => "MyString"
    ))
  end

  it "renders the edit match form" do
    render

    rendered.should have_selector("form", :action => match_path(@match), :method => "post") do |form|
      form.should have_selector("input#match_description", :name => "match[description]")
    end
  end
end
