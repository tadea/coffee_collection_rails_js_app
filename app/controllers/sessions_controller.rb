class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
       @user = User.find_by(email: params[:user][:email])
       if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to coffees_path
       else
        #flash[:message] = "Something went wrong!"
        redirect_to root_path
       end
    end

  def home
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
