class TeamsController < ApplicationController

  before_filter :find_championship

  def new    
    @team = @championship.teams.build    
  end

  def create    
    @team = @championship.teams.build(params[:team])
    if @team.save
      redirect_to @championship      
    else
      render action: 'new'    
    end    
  end

  def destroy
    @team = @championship.teams.find(params[:id])
    @team.destroy
    redirect_to @championship    
  end

  def index   
    @teams = @championship.teams    
  end


  def edit
    @team = @championship.teams.find(params[:id])    
  end

  def update
    @team = @championship.teams.find(params[:id])  
    if @team.update_attributes(params[:team])
      redirect_to [@championship, @team]
    else
      render action: 'edit' 
    end   
  end

  def show
    @team = @championship.teams.find(params[:id])     
  end

private

  def find_championship
    @championship = Championship.find params[:championship_id]    
  end

end
