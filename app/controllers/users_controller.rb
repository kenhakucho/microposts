class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :followings, :followers]
  before_action :correct_user, only: [:edit, :update]

  def index
    @user = User.page params[:page]
  end

  def show
    @micropost = @user.microposts.order(created_at: :desc)
  end

  def list
    @followed_rank = Relationship.group('followed_id')
      .order('count_followed_id desc')
      .count('followed_id').take(10).to_h
    followed_rank_ids = @followed_rank.keys
    @users = User.find(followed_rank_ids).sort_by{|o| followed_rank_ids.index(o.id)}
  end

  def new
    @user = User.new
  end
Relationship.group('followed_id').order('count_followed_id desc').count('followed_id')
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end  

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "profile update!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def followings
    @users = @user.following_users
  end
  
  def followers
    @users = @user.follower_users
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area, :profile, :birthday)
  end
  
  def set_params
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path if @user != current_user
  end
end
