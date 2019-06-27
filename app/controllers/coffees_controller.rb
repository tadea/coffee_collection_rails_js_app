class CoffeesController < ApplicationController
  before_action :find_coffee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :redirect_if_coffee_nonexistent!, only: [:show]

def index
    if !params[:grind].blank?
    @grind_id = Grind.find_by(name: params[:grind]).id
    @coffees = Coffee.where(:grind_id => @grind_id).order("created_at DESC")
  else
     @coffees = Coffee.all
     respond_to do |f|
       f.html
       f.json {render json: @coffees}
     end

  end
end

def show
end

def coffee_origin
  @coffees = Coffee.coffee_origin
  render 'coffee_origin'
end

def reviewed
  @coffees = Coffee.reviewed
  render action: :index
end


def new
  @coffee = Coffee.new
end

def create
  @coffee = Coffee.new(coffee_params)
    @coffee.user_id = current_user.id
      if @coffee.save
        flash[:success] = "#{@coffee.name} was successfully added."
      redirect_to coffee_path(@coffee)
    else
      flash[:error] = "#{@coffee.errors.full_messages.to_sentence}."
      render :new
  end
end


def edit
end

def update
  if @coffee.update(coffee_params)
    flash[:success] = "#{@coffee.name} was successfully updated."
    redirect_to coffee_path(@coffee)
  else
    render 'edit'
  end
end

def destroy
  @coffee.destroy
  flash[:success] = "#{@coffee.name} was successfully deleted."
  redirect_to coffees_path
end


private

def coffee_params
  params.require(:coffee).permit(:name, :description, :process, :grind_id, :origin, :image)
end

def find_coffee
  @coffee = Coffee.find_by(id: params[:id])
end

def redirect_if_coffee_nonexistent!
    if @coffee.nil?
      flash[:message] = 'Coffee Does Not Exist!'
      redirect_to coffees_path
    end
  end

def authenticate_user!
  if @coffee.user_id != current_user.id
    redirect_to coffees_path
  end
end

end
