module SessionHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user 
        if (id = session[:user_id])
            current_user = User.find(id) 
        elsif (id = cookies.encrypted[:user_id]) # if session doesn't have id, we gonna find in the cookies
            user = User.find(id) 
            # check if the remember token associate with the user id matches the remember digest 
            if user && user.authenticate?("remember" ,cookies[:remember_token])
                log_in user
                current_user = user 
            end
        end
    end

    def logged_user?
        !current_user.nil?
    end

    # delete two cookies on the browser
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def log_out
        if logged_user?
            forget(current_user)
            session.delete(:user_id)
            flash[:warning] = "Log out"
            redirect_to root_path
        else
            redirect_to root_path
        end

    end
    
    # create two cookies on the browser
    def remember(user)
        user.remember # this method from the model
        cookies.permanent.encrypted[:user_id] = user.id # store user_id on browser, and encrypted for safe
        cookies.permanent[:remember_token] = user.remember_token 
    end
end
