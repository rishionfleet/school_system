class StudentsController < ApplicationController

  # skip_before_action :verify_authenticity_token, only: [:destroy]

  def create
    @student = Student.new(student_params)
    @student.subjects = Subject.where(id: unsafe_params["student"]["subject_ids"])
    @student.save
    flash[:notice] = "Student '#{@student.name}' created successfully."
    redirect_to '/'
  end

  def show
    @student = Student.find_by_id(params["id"])
    @subjects = Subject.all
  end

  def index
    @students = Student.all
  end

  def teachers_details
    @teachers_details = Student.find_by_id(params["id"]).teachers
    @student = Student.find_by_id(params["id"])
    render :teachers_details
  end

  def update
    @student = Student.find_by_id(params["id"])
    @student.update_attributes(name: params["student"]["name"], roll_number: params["student"]["roll_number"], city: params["student"]["city"] )
    @student.subjects = Subject.where(id: params["student"]["subject_ids"])
    @student.save
    flash[:notice] = "Student '#{@student.name}' edited successfully."
    redirect_to student_path, id: params["id"]
  end

  def destroy
    @student = Student.find_by_id(params["id"])
    flash[:notice] = "Student: '#{@student.name}' deleted permanently."
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :roll_number, :city)
  end

  def unsafe_params
    params.to_unsafe_h
  end

end
