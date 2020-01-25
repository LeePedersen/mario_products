class ReviewsController < ApplicationController

  before_action :authorize, only: [:show, :new, :create]
  before_action :authorize_admin, only: []


  def new
    @user = User.find(session[:user_id])
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @user = User.find(session[:user_id])
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review saved!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Review not saved"
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :project_id, :rating, :content_body)
    end

end
