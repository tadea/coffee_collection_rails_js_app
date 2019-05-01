class CoffeesController < ApplicationController
  before_action :find_coffee, only: [:show, :edit, :update, :destroy]

  def index
    if params[:grind].blank?
    @coffees = Coffee.all.order("created_at DESC")
  else
    @grind_id = Grind.find_by(name: params[:grind]).id
    @coffees = Coffee.where(:grind_id => @grind_id).order("created_at DESC")
  end
  end

  def show
  end

  def new
    @coffee = Coffee.new

  end

  def create
    @coffee = Coffee.new(coffee_params)

    @coffee.user = current_user

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
    params.require(:coffee).permit(:name, :description, :process, :grind_id, :origin)
  end

  def find_coffee
    @coffee = Coffee.find(params[:id])
  end

end
