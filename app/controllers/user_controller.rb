class UserController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :cart, :bill]
  before_action :correct_user, only: [:edit, :update]
  before_action :main_admin, only: [:active_admin, :index, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "succesfully sign up"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile has successfully update"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "user destroyed"
    redirect_to user_index_path
  end

  def active_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    if @user.admin?
      flash[:success] = "Admin actived"
    else
      flash[:danger] = "Admin unactived"
    end
    redirect_to user_index_path
  end

  def cart
    @products = current_user.products
  end

  def bill
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      flash[:danger] = "Don't do that please"
      redirect_to root_path
    end
  end
end
