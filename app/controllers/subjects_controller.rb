class SubjectsController < ApplicationController

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    flash[:notice] = "Subject '#{@subject.name}' created successfully."
    redirect_to '/'
  end

  def index
    @subjects = Subject.all
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description)
  end

end
