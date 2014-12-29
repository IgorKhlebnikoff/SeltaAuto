require 'spec_helper'

RSpec.describe AnswersController, :type => :controller do
  describe "index action" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question, user: user)}
    before { get :index, question_id: question, format: :json }

    it "action index for answers" do
      body = JSON.parse(response.body)
      expect(body).to be_kind_of(Array)
    end
  end

  describe "create action" do
    let(:userd) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question, user: userd)}
    let(:answer) { FactoryGirl.create(:answer, user: user)}

    it "action create for answers_controller when true" do
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:current_user).and_return(user)
      post :create, question_id: question, user: user, answer: { body: 'answer body' }, format: :json
      expect(response.status).to eq(201)
    end
  end

end