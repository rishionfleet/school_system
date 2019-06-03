require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do

    it "should be success request" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(assigns(:student)).to be_a_new(Student)
      expect(assigns(:teacher)).to be_a_new(Teacher)
      expect(assigns(:subject)).to be_a_new(Subject)
      expect(assigns(:subjects)).to be_kind_of(ActiveRecord::Relation)
    end
  end

end
