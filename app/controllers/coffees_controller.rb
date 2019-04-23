class CoffeesController < ApplicationController

  def index
    #@coffee = Coffee.all
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = current_user.coffees.build(coffee_params)
      if @coffee.save
        #session[:user] = @user.id
      redirect_to coffee_path(@coffee)
    else
      render :new
    end

  end


  private

  def coffee_params
    params.require(:coffee).permit(:name, :description, :process, :grind)
  end

end
