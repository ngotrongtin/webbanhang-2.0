class ProductController < ApplicationController
  before_action :logged_in_user, only: [:cart, :bill, :cart_destroy]
  before_action :admin, only: [:new, :edit, :destroy, :create, :update]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @product.img.attach(params[:product][:img]) if params[:product][:img]
    if @product.save 
      flash[:success] = "Product created!"
      redirect_to root_path
    else
      render :new 
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update 
    @product = Product.find(params[:id])
    if @product && @product.update(product_params)
      flash[:success] = "Product updated!"
      redirect_to root_path
    else
      render :edit
    end
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
    product = Product.find(params[:id])
    if product 
      product.destroy 
      flash[:warning] = "Product destroyed"
      redirect_to root_path
    else  
      redirect_to root_path
    end
  end
  private 
  def product_params 
    params.require(:product).permit(:name, :price, :img)
  end
end
