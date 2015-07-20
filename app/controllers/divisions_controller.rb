class DivisionsController < ApplicationController
  before_action :authenticate_user!
  expose(:divisions)
  expose(:division, attributes: :division_params)
  expose(:subjects)
  expose(:students) { User.with_role :student}

  def create
    binding.pry
    if division.save
      redirect_to divisions_path
    else
      render :new
    end
  end

  def update
    binding.pry
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
      params.require(:division).permit(:name, subject_ids: [], student_id: [])
    end
end
