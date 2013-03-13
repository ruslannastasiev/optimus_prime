class MicropostsController < ApplicationController  

  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path      
    else
      render 'pages/home'      
    end
  end

  def destroy
    @micropost = current_user.microposts.find_by_id(params[:id])
    @micropost.destroy
    redirect_to root_path
  end

end