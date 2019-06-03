require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  let(:student) { create(:student) }

  describe "POST #create" do
    it "should be success request" do
      post :create, params: { student: {name: 'Tom', roll_number: 223, city: 'Delhi'} }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to '/'
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:student)).to be_kind_of(Student)
      expect(flash[:notice]).to eq "Student 'Tom' created successfully."
    end
  end

  describe "GET #show" do
    it "should be success request" do
      get :show, params: { id: student.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:student)).to be_kind_of(Student)
      expect(assigns(:subjects)).to be_kind_of(ActiveRecord::Relation)
    end
  end

  describe "GET #index" do
    it "should be success request" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:students)).to be_kind_of(ActiveRecord::Relation)
    end
  end

  describe "GET #teachers_details" do
    it "should be success request" do
      get :teachers_details, params: { id: student.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:teachers_details)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:student)).to be_kind_of(Student)
      expect(assigns(:teachers_details)).to be_kind_of(ActiveRecord::Relation)
    end
  end

  describe "PUT #update" do
    it "should be success a request" do
      put :update, params: { id: student.id, student: {name: 'Tom', roll_number: 223, city: 'Delhi'} }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(student_path)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:student)).to be_kind_of(Student)
      expect(flash[:notice]).to eq "Student 'Tom' edited successfully."
    end
  end

  describe "POST #destroy" do
    it "should be success a request" do
      post :destroy, params: { id: student.id}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(students_path)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:student)).to be_kind_of(Student)
      expect(flash[:notice]).to eq "Student: '#{student.name}' deleted permanently."
    end
  end

end
