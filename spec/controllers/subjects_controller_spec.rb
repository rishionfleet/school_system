require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do

  describe "POST #create" do
    it "should be success request" do
      post :create, params: { subject: {name: 'English', description: "Intermediate"} }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to '/'
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:subject)).to be_kind_of(Subject)
      expect(flash[:notice]).to eq "Subject 'English' created successfully."
    end
  end

  describe "GET #index" do
    it "should be success request" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:subjects)).to be_kind_of(ActiveRecord::Relation)
    end
  end

end
