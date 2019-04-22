class SessionsController < ApplicationController
  def new
    @user = User.new
    render :login
  end

  def create
       @user = User.find_by(email: params[:email])
       if @user  && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
       else
        flash[:message] = "Something went wrong!"
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
