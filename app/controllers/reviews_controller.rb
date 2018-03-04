class ReviewsController < ApplicationController

  before_action :require_login

  def create

    @review = Review.create(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to :back
    else
      render json: @review.errors, status: :bad_request
    end
    
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to "/products/#{params[:product_id]}"
  end


  private

  def add_user_id
    @review.user = current_user
  end

  def review_params
    params.require(:reviews).permit(:rating, :description)
  end

  private
 
  def require_login

    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path
    end
  end

end