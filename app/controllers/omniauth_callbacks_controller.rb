class OmniauthCallbacksController < ApplicationController
    def google_oauth2
      @user = User.from_omniauth request.env["omniauth.auth"]
  
      if @user.persisted?
        log_in(@user)
        flash[:notice] = "Successfully authenticated from Google account."
        redirect_to root_path
        #sign_in_and_redirect @user, event: :authentication
  
      else
        flash[:notice] = "lỗi"
        redirect_to new_user_path
      end
    end
  end
  