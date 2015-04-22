require 'rails_helper'

RSpec.describe RegistratedApplicationsController, :type => :controller do

  describe "GET Index" do
    it "returns http success" do
      get :Index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET Show" do
    it "returns http success" do
      get :Show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET Edit" do
    it "returns http success" do
      get :Edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET New" do
    it "returns http success" do
      get :New
      expect(response).to have_http_status(:success)
    end
  end

end
