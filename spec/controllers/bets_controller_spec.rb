require 'spec_helper'

describe BetsController do

  def mock_bet(stubs={})
    @mock_bet ||= mock_model(Bet, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all bets as @bets" do
      Bet.stub(:all) { [mock_bet] }
      get :index
      assigns(:bets).should eq([mock_bet])
    end
  end

  describe "GET show" do
    it "assigns the requested bet as @bet" do
      Bet.stub(:find).with("37") { mock_bet }
      get :show, :id => "37"
      assigns(:bet).should be(mock_bet)
    end
  end

  describe "GET new" do
    it "assigns a new bet as @bet" do
      Bet.stub(:new) { mock_bet }
      get :new
      assigns(:bet).should be(mock_bet)
    end
  end

  describe "GET edit" do
    it "assigns the requested bet as @bet" do
      Bet.stub(:find).with("37") { mock_bet }
      get :edit, :id => "37"
      assigns(:bet).should be(mock_bet)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created bet as @bet" do
        Bet.stub(:new).with({'these' => 'params'}) { mock_bet(:save => true) }
        post :create, :bet => {'these' => 'params'}
        assigns(:bet).should be(mock_bet)
      end

      it "redirects to the created bet" do
        Bet.stub(:new) { mock_bet(:save => true) }
        post :create, :bet => {}
        response.should redirect_to(bet_url(mock_bet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bet as @bet" do
        Bet.stub(:new).with({'these' => 'params'}) { mock_bet(:save => false) }
        post :create, :bet => {'these' => 'params'}
        assigns(:bet).should be(mock_bet)
      end

      it "re-renders the 'new' template" do
        Bet.stub(:new) { mock_bet(:save => false) }
        post :create, :bet => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested bet" do
        Bet.should_receive(:find).with("37") { mock_bet }
        mock_bet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bet => {'these' => 'params'}
      end

      it "assigns the requested bet as @bet" do
        Bet.stub(:find) { mock_bet(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:bet).should be(mock_bet)
      end

      it "redirects to the bet" do
        Bet.stub(:find) { mock_bet(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(bet_url(mock_bet))
      end
    end

    describe "with invalid params" do
      it "assigns the bet as @bet" do
        Bet.stub(:find) { mock_bet(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:bet).should be(mock_bet)
      end

      it "re-renders the 'edit' template" do
        Bet.stub(:find) { mock_bet(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested bet" do
      Bet.should_receive(:find).with("37") { mock_bet }
      mock_bet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bets list" do
      Bet.stub(:find) { mock_bet }
      delete :destroy, :id => "1"
      response.should redirect_to(bets_url)
    end
  end

end
