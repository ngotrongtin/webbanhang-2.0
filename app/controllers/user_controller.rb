class UserController < ApplicationController
    before_action :logged_user?, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]
    
    def new
        @user = User.new
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

    private
    def user_params
        params.require(:user).permit(:name,:email , :password, :password_confirmation)
    end

    def correct_user 
        user = User.find(params[:id])
        if user != current_user
            flash[:danger] = "Don't do that please"
            redirect_to root_path 
        end
    end
end
