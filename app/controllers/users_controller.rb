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

  def new
    @user = User.new
    if @user.save
      redirect_to '/admin'
    end
  end

  # def show
  #   @user = User.find_by(id: params[:id])
  #   if @current_user.id != user.id
  #     flash[:admin_violation] = "Need special permissions."
  #     redirect_to '/'
  #   end
    
  #   # else
  #   #   redirect_to '/'
  #   #   flash[:admin_violation] = "Need special permissions."
  #   # end
  # end

  def destroy
    User.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
  end

  def edit
    id = params[:id]
    @user = User.find_by(id: id)
    if @user.id != current_user.id
      flash[:admin_violation] = "Need special permissions."
      redirect_to '/'
    end
  end

  def create
    @user = User.new(user_params)
    letters = ('A'..'Z').to_a
    password_string = (0...8).map { |n| letters.sample }.join
    @user.password = password_string
    if @user.save
      puts password_string
    UserMailer.welcome_client(@user, password_string).deliver_now
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
