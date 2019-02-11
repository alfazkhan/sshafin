class SessionsController < ApplicationController

  def new

  end

  def create
    admin = Admin.find_by(username:params[:session][:username])

    if admin && admin.authenticate(params[:session][:password])
      session[:user_id]=admin.id
      flash[:success]="Welcome Sir...or Mam....okay I don't know just Welcome"
      redirect_to admin_path(admin.id)
    else
      flash.now[:danger]="I am Saw-Ry Wrong Password"
      render 'new'
    end

  end

  def delete
    session[:admin_id]=nil
    flash[:danger] = "Everyone Left Me Now you too, Come Back Later!"
    redirect_to root_path
  end
end