class DivisionsController < ApplicationController
  before_action :is_headmaster?, only: [:new, :create, :destroy, :edit, :update]
  expose(:divisions)
  expose(:division, attributes: :division_params)
  expose(:division_subjects) { division.subjects}
  expose(:subjects)
  expose(:assignable) { User.unnasigneds_and_class_students(division.id) }
  expose(:students) { division.students }

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
      params.require(:division).permit(:name, subject_ids: [], student_ids: [])
    end

    def is_headmaster?
      redirect_to(admin_user_path(current_user)) unless current_user.has_role? :headmaster
    end
end
