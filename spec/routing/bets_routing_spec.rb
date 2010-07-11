require "spec_helper"

describe BetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      {:get => "/bets"}.should route_to(:controller => "bets", :action => "index")
    end

    it "recognizes and generates #new" do
      {:get => "/bets/new"}.should route_to(:controller => "bets", :action => "new")
    end

    it "recognizes and generates #show" do
      {:get => "/bets/1"}.should route_to(:controller => "bets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      {:get => "/bets/1/edit"}.should route_to(:controller => "bets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      {:post => "/bets"}.should route_to(:controller => "bets", :action => "create")
    end

    it "recognizes and generates #update" do
      {:put => "/bets/1"}.should route_to(:controller => "bets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      {:delete => "/bets/1"}.should route_to(:controller => "bets", :action => "destroy", :id => "1")
    end

  end
end
