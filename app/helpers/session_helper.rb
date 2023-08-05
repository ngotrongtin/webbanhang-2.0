module SessionHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user 
        if (id = session[:user_id])
            user = User.find(id)
        end
        return user
    end

    def logged_user?
        !current_user.nil?
    end

    def forget_user 
        if logged_user?
            session.delete(:user_id)
            current_user = nil
            flash[:warning] = "Log out"
            redirect_to root_path
        end
    end
end
