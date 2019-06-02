class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def create
    subject = Subject.new(subject_params)
    subject.save
    flash[:notice] = "Subject '#{subject.name}' created successfully."
    redirect_to '/'
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description)
  end

end
