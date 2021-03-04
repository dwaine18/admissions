class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  @user = User.find(params[:id])
  @adcom = Adcom.where(user_id: @user.id)
  @student = Student.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User successfully upgraded to admin"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      flash[:error]
      flash.keep
      redirect_to '/users/#{@user.id}/edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:id, :admin)
  end
end
