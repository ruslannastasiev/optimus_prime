class SeasonsController < ApplicationController

  before_filter :find_championship

  def new    
    @season = @championship.seasons.build    
  end  

  def create
    @season = @championship.seasons.build(params[:season])    
    if @season.save
      @season.start_season
      redirect_to [@championship, @season]      
    else
      render action: 'new'    
    end
  end

  def show
    @season = @championship.seasons.find(params[:id])
    @scores = @season.scores    
  end

private

  def find_championship
    @championship = Championship.find params[:championship_id]    
  end

end