class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    if current_user && current_user.user_type == "admin"
      @users = User.all
    else
      redirect_to '/'
      flash[:admin_violation] = "Need special permissions."
    end
  end

  def show
    if current_user.id == user.id
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
      flash[:admin_violation] = "Need special permissions."
    end
  end

   def destroy
    User.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
  end

  def edit
    id = params[:id]
    @user = User.find_by(id: id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/admin"
    else
    render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

end
