class AdminsController < ApplicationController

  before_action :logged_in?
  before_action :set_user,only:[:edit,:update,:show]
  before_action :require_same_user, only: [:edit,:update,:delete]
  

  #index
  def index
    @admins=Admin.paginate(page: params[:page], per_page:5)
  end

  #New user Object
  def new
    @admins=Admin.new
  end

  #New Admin Create
  def create
    @admins = Admin.new(admin_params)

    if @admins.save
      session[:user_id]=@admins.id
      flash[:success] = "Welcome, #{@admins.username}"
      redirect_to admin_path(@admins.id)
    else
      render 'new'
    end
  end

  #Edit Object
  def edit

  end

  #Update Action
  def update

    if @admins.update(admin_params)
      flash[:success] = "Admin Deatils Updated"
      redirect_to admins_path(@admins.id)
    else
      render 'edit'
    end
  end

  #show action

  def show
  if logged_in?
    @admin= Admin.last
  end
    
  end

  #Just a Prank
  

  def delete
    @admins=Admin.find(params[:id])
    @admins.destroy
    flash[:danger] = "Admin and Movies Deleted"
    redirect_to admins_path
  end

  

  private

  def admin_params
    params.require(:admin).permit(:username,:password)
  end

  def set_user
    @admins = Admin.find(params[:id])
  end

  def require_same_user
    if current_user != @admins and !current_user.admin?
      flash[:danger] = "You can Only Make Changes to Your Account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only Admin Can perform this Action"
      redirect_to root_path
    end
  end
end
