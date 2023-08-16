class FeedbackController < ApplicationController
    before_action :logged_in_user
    def create 
        if FeedBack.create(feedback_params)
            redirect_to product_path(params[:product_id])
        else
            redirect_to root_path 
        end
    end
    private
    def feedback_params 
        params.permit(:product_id, :reviewer_id, :content)
    end
end
