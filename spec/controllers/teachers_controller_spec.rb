require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

  let(:teacher) { create(:teacher) }

  describe "POST #create" do
    it "should be success request" do
      post :create, params: { teacher: {name: 'Tom', education: "Graduate" } }
      expect(response).to have_http_status(:success)
      expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"
      expect(assigns(:teacher)).to be_kind_of(Teacher)
      expect(flash[:notice]).to eq "Teacher 'Tom' created successfully."
    end
  end

  describe "GET #show" do
    it "should be success request" do
      get :show, params: { id: teacher.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:teacher)).to be_kind_of(Teacher)
    end
  end

  describe "GET #index" do
    it "should be success request" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:teachers)).to be_kind_of(ActiveRecord::Relation)
    end
  end

  describe "GET #teachers_details" do
    it "should be success request" do
      get :students_details, params: { id: teacher.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:students_details)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:teacher)).to be_kind_of(Teacher)
      expect(assigns(:students_details)).to be_kind_of(ActiveRecord::Relation)
    end
  end

  describe "POST #destroy" do
    it "should be success a request" do
      post :destroy, params: { id: teacher.id}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(teachers_path)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:teacher)).to be_kind_of(Teacher)
      expect(flash[:notice]).to eq "Teacher '#{teacher.name}' deleted permanently."
    end
  end

end
