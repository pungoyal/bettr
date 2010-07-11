require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    assign(:user, stub_model(User,
      :new_record? => true,
      :username => "MyString",
      :email => "MyString",
      :points => 1
    ))
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
      form.should have_selector("input#user_username", :name => "user[username]")
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_points", :name => "user[points]")
    end
  end
end
