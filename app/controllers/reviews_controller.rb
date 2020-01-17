class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
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

  private
    def review_params
      params.require(:review).permit(:author, :project_id, :rating, :content_body)
    end

end
