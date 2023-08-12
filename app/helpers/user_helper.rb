module UserHelper
    def main_admin
        unless current_user.email == "tigopro.1703@gmail.com"
            flash[:danger] = "You don't have permit"
            redirect_to root_path
        end
    end

    def admin
        if !current_user.admin?
            flash[:danger] = "You don't have permit"
            redirect_to root_path
        end 
    end
end
