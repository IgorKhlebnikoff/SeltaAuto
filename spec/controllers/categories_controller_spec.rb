require 'spec_helper'

RSpec.describe CategoriesController, :type => :controller do
  describe "#new" do
    before {get :new}
    it "renders template new" do
      expect(response).to render_template(:new)
    end
    it "sets status 200" do
      expect(response.status).to eq(200)
    end
    it "set's category not nill" do
      expect(assigns(:category)).to be_kind_of(Category)
    end
  end

  describe "#create" do
    it "redirect template to news/index" do
      post :create, category: {name: "some name"}
      expect(response).to redirect_to news_index_path(assigns(:category))
    end
    it "render template to new" do
      post :create, category: {name: ""}
      expect(response).to render_template(:new)
    end
  end

  describe "#update"  do
    let!(:category) { Category.create(name: "some name") }
    it "update category" do
      put :update, id: category, category:{name: "some second name"}
      expect(assigns(:category)).to be_kind_of(Category)
    end
    it "contain status 200" do
      expect(response.status).to eq(200)
    end
  end
  describe "#destroy"  do
    let!(:category) { Category.create(name: "some name") }
    it "contain category" do
      delete :destroy, id: category
      expect(assigns(:category)).to be
    end
    it "contain status 302" do
      delete :destroy, id: category
      expect(response.status).to eq(302)
    end
  end
end