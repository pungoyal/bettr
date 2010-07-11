require 'spec_helper'

describe "users/show.html.haml" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "Username",
      :email => "Email",
      :points => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Username".to_s)
    rendered.should contain("Email".to_s)
    rendered.should contain(1.to_s)
  end
end
