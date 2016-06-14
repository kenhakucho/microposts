class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create 
    @microposts = current_user.microposts.build(microposts_params)
    if @microposts.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_page/home'
    end
  end

  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
  def microposts_params
    params.require(:micropost).permit(:content)
  end
end
