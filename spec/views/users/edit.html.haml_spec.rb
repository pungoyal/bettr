require 'spec_helper'

describe "users/edit.html.haml" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :new_record? => false,
      :username => "MyString",
      :email => "MyString",
      :points => 1
    ))
  end

  it "renders the edit user form" do
    render

    rendered.should have_selector("form", :action => user_path(@user), :method => "post") do |form|
      form.should have_selector("input#user_username", :name => "user[username]")
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_points", :name => "user[points]")
    end
  end
end
