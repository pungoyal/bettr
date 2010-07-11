require 'spec_helper'

describe "teams/edit.html.haml" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :new_record? => false,
      :name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit team form" do
    render

    rendered.should have_selector("form", :action => team_path(@team), :method => "post") do |form|
      form.should have_selector("input#team_name", :name => "team[name]")
      form.should have_selector("input#team_code", :name => "team[code]")
    end
  end
end
