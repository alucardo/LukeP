class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:users)
  expose(:user, attributes: :user_params)

  def create
    if user.save
      redirect_to admin_user_path(user)
    else
      render :new
    end
  end


  def update
    if user.update(user_params)
      redirect_to admin_user_path(user)
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to admin_users_path
  end

  private

    def user_params
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password_confirmation)
        params[:user].delete(:password)
      end
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end
