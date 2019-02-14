class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => :create
  before_action :logged_in?, only:[:admin]

  def new

  end

  def admin
    if !logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(username:params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:success]="Welcome Sir"
      render 'admin'
    else
      flash.now[:danger]="Wrong Password"
      render 'new'
    end
  end

  def delete
    session[:user_id]=nil
    flash[:danger] = "Good bye!"
    redirect_to root_path
  end
end
