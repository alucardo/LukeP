class DivisionsController < ApplicationController
  before_action :is_headmaster?, only: [:new, :create, :destroy, :edit, :update]
  expose(:divisions)
  expose(:division, attributes: :division_params)
  expose(:division_subjects) { division.subjects}
  expose(:teacher_divisions) { Division.teacher_divisions(current_user.id) }
  expose(:subjects)
  expose(:teacher_subjects) {  Subject.teacher_subjects_in_division(current_user.id, division.id) }
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
