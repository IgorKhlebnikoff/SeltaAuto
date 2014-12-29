require 'spec_helper'

RSpec.describe CommentsController, :type => :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:article) { FactoryGirl.create(:news)}
  describe "#index" do
    before { get :index, news_id: article, format: :json }
    it "action index for comments" do
      body = JSON.parse(response.body)
      expect(body).to be_kind_of(Array)
    end
  end

  describe "#create" do
    let(:comment) { FactoryGirl.create(:comment, user: user)}
    before {
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:current_user).and_return(user)}
    it "returns status 201" do
      post :create, news_id: article, user: user, comment: { body: 'answer body' }, format: :json
      expect(response.status).to eq(201)
    end
  end

  describe "#destroy" do
    let(:comment) { FactoryGirl.create(:comment, user: user, news: article)}
    before {
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:current_user).and_return(user)}
    it "returns status 204" do
      delete :destroy, news_id: article, id: comment, format: :json
      expect(response.status).to eq(204)
    end
  end
end