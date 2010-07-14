class BetsController < ApplicationController
  def index
    @bets = Bet.all

    respond_to do |format|
      format.html
      format.json { render :json => @bets }
    end
  end

  def show
    @bet = Bet.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @bet }
    end
  end

  def new
    @bet = Bet.new

    respond_to do |format|
      format.html
      format.json { render :json => @bet }
    end
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def create
    @bet = Bet.new(params[:bet])

    respond_to do |format|
      if @bet.save
        format.html { redirect_to(@bet, :notice => 'Bet was successfully created.') }
        format.json { render :json => @bet, :status => :created, :location => @bet }
      else
        format.html { render :action => "new" }
        format.json { render :json => @bet.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @bet = Bet.find(params[:id])

    respond_to do |format|
      if @bet.update_attributes(params[:bet])
        format.html { redirect_to(@bet, :notice => 'Bet was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @bet.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy

    respond_to do |format|
      format.html { redirect_to(bets_url) }
      format.json { head :ok }
    end
  end
end
