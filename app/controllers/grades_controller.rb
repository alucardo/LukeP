class GradesController < ApplicationController
  expose(:grades)
  expose(:grade, attributes: :grade_params)
  expose(:subjects)
  expose(:division)
  expose(:student_ab) { User.find(params[:user]) }
  expose(:teacher_subjects) { Subject.teacher_subjects_in_division(current_user.id, student_ab.division_id)}

  def create
    if grade.save
      redirect_to division_path(grade.student.division_id)
    else
      render :new
    end
  end

  def update
    if grade.save
      redirect_to division_path(grade.student.division_id)
    else
      render :edit
    end
  end

  def destroy
    grade.destroy
    redirect_to division_path(grade.student.division_id)
  end

  private

    def grade_params
      params.require(:grade).permit(:grade, :student_id, :subject_id)
    end
end
