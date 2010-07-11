require 'spec_helper'

describe MatchesController do

  def mock_match(stubs={})
    @mock_match ||= mock_model(Match, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all matches as @matches" do
      Match.stub(:all) { [mock_match] }
      get :index
      assigns(:matches).should eq([mock_match])
    end
  end

  describe "GET show" do
    it "assigns the requested match as @match" do
      Match.stub(:find).with("37") { mock_match }
      get :show, :id => "37"
      assigns(:match).should be(mock_match)
    end
  end

  describe "GET new" do
    it "assigns a new match as @match" do
      Match.stub(:new) { mock_match }
      get :new
      assigns(:match).should be(mock_match)
    end
  end

  describe "GET edit" do
    it "assigns the requested match as @match" do
      Match.stub(:find).with("37") { mock_match }
      get :edit, :id => "37"
      assigns(:match).should be(mock_match)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created match as @match" do
        Match.stub(:new).with({'these' => 'params'}) { mock_match(:save => true) }
        post :create, :match => {'these' => 'params'}
        assigns(:match).should be(mock_match)
      end

      it "redirects to the created match" do
        Match.stub(:new) { mock_match(:save => true) }
        post :create, :match => {}
        response.should redirect_to(match_url(mock_match))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved match as @match" do
        Match.stub(:new).with({'these' => 'params'}) { mock_match(:save => false) }
        post :create, :match => {'these' => 'params'}
        assigns(:match).should be(mock_match)
      end

      it "re-renders the 'new' template" do
        Match.stub(:new) { mock_match(:save => false) }
        post :create, :match => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested match" do
        Match.should_receive(:find).with("37") { mock_match }
        mock_match.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :match => {'these' => 'params'}
      end

      it "assigns the requested match as @match" do
        Match.stub(:find) { mock_match(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:match).should be(mock_match)
      end

      it "redirects to the match" do
        Match.stub(:find) { mock_match(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(match_url(mock_match))
      end
    end

    describe "with invalid params" do
      it "assigns the match as @match" do
        Match.stub(:find) { mock_match(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:match).should be(mock_match)
      end

      it "re-renders the 'edit' template" do
        Match.stub(:find) { mock_match(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested match" do
      Match.should_receive(:find).with("37") { mock_match }
      mock_match.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the matches list" do
      Match.stub(:find) { mock_match }
      delete :destroy, :id => "1"
      response.should redirect_to(matches_url)
    end
  end

end
