class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:users)
  expose(:user, attributes: :user_params)


  def create
    if user.save
      roles.each { |r| role_adder(r) }
      redirect_to user, notice: 'User was successfully updated'
    else
      render :new
    end
  end


  def update
    if user.update(user_params)
      roles.each { |r| role_adder(r) }
      redirect_to user, notice: 'User was successfully updated'
    else
      render :edit, notice: 'Ups'
    end
  end

  def destroy
    user.destroy
    redirect_to users_path, notice: 'User was sucessfully destroyed'
  end

  private

    def user_params
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password_confirmation)
        params[:user].delete(:password)
      end
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def role_adder(role)
      if params[role] == "1"
        @user.add_role(role)
      elsif params[role] == "0"
        @user.remove_role(role)
      end
    end
end
