class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(id: params[:session][:id])
    if @user
      log_in(@user)
      flash[:notice] = "Welcome! Access permitted!"
      redirect_to root_path
    else
      flash[:alert] = "Id inconnue"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
