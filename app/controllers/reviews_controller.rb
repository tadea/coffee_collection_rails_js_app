class ReviewsController < ApplicationController

before_action :find_coffee
before_action :find_review, only: [ :edit, :update, :destroy]

def new
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  @review.coffee_id = @coffee.id
  @review.user_id = current_user.id
    if @review.save
      redirect_to coffee_path(@coffee)
    else
      flash[:error] = "All fields are required"
      render :new
    end
end


def edit
end

def update
  if @review.update(review_params)
    flash[:success] = "Successfully updated!"
    redirect_to coffee_path(@coffee)
  else
    render 'edit'
  end
end

def destroy
  @review.destroy
  redirect_to coffees_path
end
end


private

  def review_params
    params.require(:review).permit(:comment)
  end

  def find_coffee
    @coffee = Coffee.find(params[:coffee_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
