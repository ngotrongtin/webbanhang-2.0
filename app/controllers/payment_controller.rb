class PaymentController < ApplicationController
    before_action :logged_in_user
    def create 
        product = Product.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
                currency: 'usd',
                product_data: {
                  name: product.name,
                },
                unit_amount: 99, # Chuyển đổi giá tiền sang đơn vị cent
              },
              quantity: 1,
            }],
            mode: "payment",
            success_url: root_url,
            cancel_url: root_url
        })

        redirect_to @session.url , allow_other_host: true
    end
end