require 'spec_helper'

RSpec.describe PhotosController, :type => :controller do
  let!(:photo) { Photo.create(asset_file_name: "some name") }
  describe "#index" do
    before {get :index}
    it "contains template index" do
      expect(response).to render_template(:index)
    end
    it "include certificate" do
      expect(assigns(:photos)).to include(photo)
    end
    it "returns status 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    before do
      controller.stub(:authenticate_user!).and_return(true)
      get :new
    end
    it "contains template new" do
      expect(response).to render_template(:new)
    end
    it "sets a new photo" do
      expect(assigns(:photo)).to be_kind_of(Photo)
    end
  end

  describe "#create" do
    before do
      controller.stub(:authenticate_user!).and_return(true)
    end
    it "redirects to photos" do
      post :create, photo: {asset_file_name: "some name"}
      expect(response).to redirect_to photos_path
    end
    it "return status 302" do
      post :create, photo: {asset_file_name: "some name"}
      expect(response.status).to eq(302)
    end
  end

  describe "#update" do
    let!(:photo) { Photo.create(asset_file_name: "some name") }
    before do
      controller.stub(:authenticate_user!).and_return(true)
    end
    it "redirects to certificates" do
      put :update, id: photo, photo: {asset_file_name: "some second name"}
      expect(response).to redirect_to photos_path
    end
    it "return status 302" do
      put :update, id: photo, photo: {asset_file_name: "some second name"}
      expect(response.status).to eq(302)
    end
  end

  describe "#destroy" do
    let(:photo) { Photo.create(asset_file_name: "some name") }
    before do
      controller.stub(:authenticate_user!).and_return(true)
    end
    it "redirects to certificates" do
      delete :destroy, id: photo
      expect(response).to redirect_to photos_path
    end
    it "return status 302" do
      delete :destroy, id: photo
      expect(response.status).to eq(302)
    end
  end
  describe "#edit" do
    let!(:photo) { Photo.create(asset_file_name: "some name") }
    before do
      get :edit,  {:id => photo.id}
    end
    it "contains template edit" do
      expect(response).to render_template(:edit)
    end
    it "returns status 200" do
      expect(response.status).to eq(200)
    end
  end
end