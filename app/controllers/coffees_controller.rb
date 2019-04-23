class CoffeesController < ApplicationController

  def index
    @coffee = Coffee.all
  end

  def new
    @coffee = Coffee.new
  end

  def create

    @coffee = Coffee.new(coffee_params)

      if @coffee.save
      redirect_to coffees_path(@coffee)
    else
      render :new
    end

  end


  private

  def coffee_params
    params.require(:coffee).permit(:name, :description, :process, :grind)
  end

end
