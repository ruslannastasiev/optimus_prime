class ScoresController < ApplicationController
  
  def create    
    @score = Score.new params[:score]
    @score.save 
    redirect_to :back        
  end

  def update
    @score = Score.find params[:id]
    @score.update_attributes params[:score]
    redirect_to :back    
  end

end
