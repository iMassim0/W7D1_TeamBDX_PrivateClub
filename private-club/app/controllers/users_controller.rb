class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params_user)
    if @user.save
      flash[:notice] = 'ACCOUNT WAS CREATED'
      log_in @user
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join(" && ")
      redirect_to signup_url
    end
  end

  def edit
    @user = User.find(params[:id])
     if owner(@user)
     else
       flash[:error] = "YOU DON'T HAVE PERMISSION"
       redirect_to index_path
     end
  end

  def index
    @users = User.all
    @current_user = current_user
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(params_user)
    if @user.save
      flash[:notice] = "CHANGING DONE"
      redirect_to index_path
    else
      flash[:error] = @user.errors.full_messages.join(" && ")
      redirect_to edit_user_path(@user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to index_path
  end

  private

  def params_user
    params_user = params.require(:user).permit(:firstname, :lastname, :email)
  end

end
