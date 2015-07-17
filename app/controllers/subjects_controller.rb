class SubjectsController < ApplicationController
before_action :authenticate_user!
expose(:subjects)
expose(:subject, attributes: :subject_params)

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
    params.require(:subject).permit(:name)
  end
end
