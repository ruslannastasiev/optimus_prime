class PagesController < ApplicationController

  def home    
    if current_user
      @micropost = Micropost.new
      @feed_items = Micropost.scoped.paginate(:page => params[:page])
    end
  end

  def contact
  end

  def profile
  end
end

