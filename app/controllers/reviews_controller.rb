class ReviewsController < ApplicationController

  before_action :authorize, only: [:new, :create]
  before_action :authorize_admin, only: [:destroy]


  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
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
