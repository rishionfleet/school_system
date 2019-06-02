class TeachersController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:destroy]

  def create
    teacher = Teacher.new(teacher_params)
    teacher.subjects = Subject.where(id: unsafe_params["teacher"]["subject_ids"])
    teacher.save
    flash[:notice] = "Teacher '#{teacher.name}' created successfully."
    redirect_to '/'
  end

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find_by_id(params["id"])
  end

  def destroy
    teacher = Teacher.find_by_id(params["id"])
    flash[:notice] = "Teacher '#{teacher.name}' deleted permanently."
    teacher.destroy
    redirect_to teachers_path
  end

  def students_details
    @students_details = Teacher.find_by_id(params["id"]).students
    @teacher = Teacher.find_by_id(params["id"])
    render :students_details
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :education)
  end

  def unsafe_params
    params.to_unsafe_h
  end

end
