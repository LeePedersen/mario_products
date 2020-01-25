class ProductsController < ApplicationController

  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
    render :index
  end

  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @product = Product.new
    render :new
  end

  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
      flash[:notice] = "Product saved!"
    else
      flash[:alert] = "Product not saved"
      render :new
    end
  end

  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    render :show
  end

  def update
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
      flash[:notice] = "Product updated!"
    else
      flash[:alert] = "Product not updated"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.reviews.each do |review|
      review.destroy
    end
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end
