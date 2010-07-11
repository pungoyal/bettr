require 'spec_helper'

describe "matches/new.html.haml" do
  before(:each) do
    assign(:match, stub_model(Match,
      :new_record? => true,
      :description => "MyString"
    ))
  end

  it "renders new match form" do
    render

    rendered.should have_selector("form", :action => matches_path, :method => "post") do |form|
      form.should have_selector("input#match_description", :name => "match[description]")
    end
  end
end
