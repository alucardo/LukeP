class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:users)
  expose(:user)

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update

  end

  def destroy
    user.destroy
    redirect_to users_path, notice: 'User was sucessfully destroyed'
  end
end
