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
    flash[:notice] = "The information you provided does not match our records. Please re-enter your login information or signup."
    redirect_to login_path
  end
end

def fbcreate
  @user = User.find_or_create_by(uid: auth['uid']) do |u|
    u.email = auth['info']['email']
    u.password = auth['uid']
  end
    session[:user_id] = @user.id
    redirect_to coffees_path
end

def home
end

def destroy
  session.clear
  redirect_to '/'
end


private

  def auth
    request.env['omniauth.auth']
  end
end
