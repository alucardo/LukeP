class SubjectsController < ApplicationController
  before_action :is_headmaster?, only: [:new, :create, :destroy, :edit, :update]
  expose(:subjects)
  expose(:subject, attributes: :subject_params)
  expose(:users) { User.with_role :teacher}

  def create
    if subject.save
      redirect_to subjects_path
    else
      render :new
    end
  end

  def update
    if subject.save
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def destroy
    subject.destroy
    redirect_to subjects_path
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :teacher_id)
    end

    def is_headmaster?
      redirect_to(admin_user_path(current_user)) unless current_user.has_role? :headmaster
    end
end
