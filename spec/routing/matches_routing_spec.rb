require "spec_helper"

describe MatchesController do
  describe "routing" do

    it "recognizes and generates #index" do
      {:get => "/matches"}.should route_to(:controller => "matches", :action => "index")
    end

    it "recognizes and generates #new" do
      {:get => "/matches/new"}.should route_to(:controller => "matches", :action => "new")
    end

    it "recognizes and generates #show" do
      {:get => "/matches/1"}.should route_to(:controller => "matches", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      {:get => "/matches/1/edit"}.should route_to(:controller => "matches", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      {:post => "/matches"}.should route_to(:controller => "matches", :action => "create")
    end

    it "recognizes and generates #update" do
      {:put => "/matches/1"}.should route_to(:controller => "matches", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      {:delete => "/matches/1"}.should route_to(:controller => "matches", :action => "destroy", :id => "1")
    end

  end
end
