class CoffeesController < ApplicationController
  before_action :find_coffee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

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

    @coffee.user_id = current_user.id
      if @coffee.save
      redirect_to coffee_path(@coffee)
    else
      flash[:error] = "All fields are required"
      render :new
    end
  end


  def edit
  end

  def update
    if @coffee.update(coffee_params)
      flash[:message] = "Successfully updated!"
      redirect_to coffee_path(@coffee)
    else
      render 'edit'
    end
  end

  def destroy
    @coffee.destroy
    flash[:message] = "Successfully deleted!"
    redirect_to coffees_path
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :description, :process, :grind_id, :origin, :image)
  end

  def find_coffee
    @coffee = Coffee.find(params[:id])
  end

  def authenticate_user!
    if @coffee.user_id != current_user.id
      #flash[:error] = "You can only edit and delete if you created Coffee!"
      redirect_to coffees_path
    end
  end

end
