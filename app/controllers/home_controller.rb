class HomeController < ApplicationController
  def show
    @student = Student.new
    @student_count = Student.count
    @teacher = Teacher.new
    @teacher_count = Teacher.count
    @subject_new = Subject.new
    @subject_count = Subject.count
    @subjects = Subject.all
  end
end
