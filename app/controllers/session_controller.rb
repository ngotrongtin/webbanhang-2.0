class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in(user)
      # if a user logged in and wanna log in again without remember, we gonna delete the cookies from previous
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
      flash[:success] = "successfully log in"
      redirect_to root_path
    else 
      flash.now[:danger] = "email or password is wrong"
      render :new
    end  
  end

  def destroy
    log_out
  end

  private 
  def session_params 
    params.require(:session).permit(:email, :password) 
  end
end
