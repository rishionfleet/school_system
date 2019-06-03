class HomeController < ApplicationController
  def index
    @student = Student.new
    @teacher = Teacher.new
    @subject = Subject.new
    @subjects = Subject.all
  end
end
