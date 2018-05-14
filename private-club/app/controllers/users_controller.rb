class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params_user)
    if @user.save
      flash[:notice] = 'Profil enregistré, veuillez vous connecter svp.'
      log_in @user
      redirect_to root_path
    else
      flash[:alert] = 'Rentre bien les données nécessaires!'
      redirect_to signup_url
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(params_user)
    if @user.save
      redirect_to show_path(@user.id)
    else
      flash[:error] = 'Rentre bien un pseudo et un texte !'
      redirect_to edit_user_path(@user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def params_user
    params_user = params.require(:user).permit(:firstname, :lastname, :email)
  end

end
