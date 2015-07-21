class Admin::UsersController < ApplicationController
  before_action :is_headmaster?, only: [:new, :create, :destroy]
  before_action :is_headmaster_or_current_user?, only: [:edit, :update]
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

  def current_user_home
    redirect_to admin_user_path(current_user)
  end

  private

    def user_params
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password_confirmation)
        params[:user].delete(:password)
      end
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, role_ids:[])
    end

    def is_headmaster?
      redirect_to(admin_user_path(current_user)) unless current_user.has_role? :headmaster
    end

    def is_headmaster_or_current_user?
      unless (current_user.has_role? :headmaster) || (current_user.id == user.id)
        redirect_to(admin_users_path(current_user))
      end
    end
end
