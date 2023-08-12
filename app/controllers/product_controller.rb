class ProductController < ApplicationController
  before_action :logged_in_user, only: [:cart, :bill, :cart_destroy]
  before_action :admin, only: [:new, :edit, :destroy]
  def new
  end

  def edit
  end

  def cart 
    product = Product.find(params[:id])
    current_user.products << product unless current_user.products.include?(product)
    redirect_to root_path
  end

  def bill 
  end

  def cart_destroy
    cart = Cart.find_by(product_id: params[:pd_id], user_id: current_user.id )
    cart.destroy if cart 
    redirect_to cart_user_path(current_user)
  end

  def show
  end

  def destroy 
  end
end
