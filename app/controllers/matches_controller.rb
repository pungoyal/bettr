class MatchesController < ApplicationController
  def index
    @matches = Match.all

    respond_to do |format|
      format.html
      format.json { render :json => @matches }
    end
  end

  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @match }
    end
  end

  def new
    @match = Match.new

    respond_to do |format|
      format.html
      format.json { render :json => @match }
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def create
    @match = Match.new(params[:match])

    respond_to do |format|
      if @match.save
        format.html { redirect_to(@match, :notice => 'Match was successfully created.') }
        format.json { render :json => @match, :status => :created, :location => @match }
      else
        format.html { render :action => "new" }
        format.json { render :json => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to(@match, :notice => 'Match was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to(matches_url) }
      format.json { head :ok }
    end
  end
end
