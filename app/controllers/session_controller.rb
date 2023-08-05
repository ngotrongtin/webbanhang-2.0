class SessionController < ApplicationController
  before_action :logged_user?, only: [:destroy]
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in(user)
      flash[:success] = "successfully log in"
      redirect_to root_path
    else 
      flash.now[:danger] = "email or password is wrong"
      render :new
    end  
  end

  def destroy
    forget_user
  end

  private 
  def session_params 
    params.require(:session).permit(:email, :password) 
  end
end
