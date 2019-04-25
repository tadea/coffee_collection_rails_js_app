class CoffeesController < ApplicationController
  before_action :find_coffee, only: [:show, :edit, :update, :destroy]

  def index
    @coffees = Coffee.all.order("created_at DESC")
  end

  def show
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


  def edit
  end

  def update
    if @coffee.update(coffee_params)
      redirect_to coffee_path(@coffee)
    else
      render 'edit'
    end
  end

  def destroy
    @coffee.destroy
    redirect_to coffees_path
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :description, :process, :grind, :origin_id)
  end

  def find_coffee
    @coffee = Coffee.find(params[:id])
  end

end
