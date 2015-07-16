class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:users)

  def show
  end

  def index
  end
end
