class DivisionsController < ApplicationController
  before_action :authenticate_user!
  expose(:divisions)
  expose(:division, attributes: :division_params)

  def create
    if division.save
      redirect_to divisions_path
    else
      render :new
    end
  end

  def update
    if division.save
      redirect_to divisions_path
    else
      render :edit
    end
  end

  def destroy
    division.destroy
    redirect_to divisions_path
  end

  private

    def division_params
      params.require(:division).permit(:name)
    end
end
