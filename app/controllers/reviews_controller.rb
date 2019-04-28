class ReviewsController < ApplicationController

  def index
  end

  def new

  end

  def show
  end

  def create
    
  end

def edit
end

def update
end

def destroy
end
private

def review_params
  params.require(:review).permit(:comment)
end

end
