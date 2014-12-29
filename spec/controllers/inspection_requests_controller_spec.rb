require 'spec_helper'

describe InspectionRequestsController do
  let(:user) { FactoryGirl.create(:user) }

  describe 'logged out user' do
    describe '#create' do
      let(:inspection_request_attrs) { FactoryGirl.attributes_for(:inspection_request) }

      before { post :create, inspection_request: inspection_request_attrs, format: :json }

      it { should respond_with(201) }
    end
  end

  describe 'logged in user' do
    let(:inspection_request) { FactoryGirl.create(:inspection_request) }

    before do
      controller.stub(:authenticate_user!).and_return(true)
      controller.stub(:current_user).and_return(user)
    end

    describe '#index' do
      let!(:inspection_requests) { 3.times { FactoryGirl.create(:inspection_request) } }
      let!(:viewed_inspection_requests) { 3.times { FactoryGirl.create(:viewed_inspection_request) } }

      before { get :index, format: :json }

      it { should respond_with(200) }

      it 'contains 6 items' do
        expect(JSON.parse(response.body).size).to eq(6)
      end
    end

    describe '#show' do
      let!(:inspection_request) { FactoryGirl.create(:inspection_request) }

      before { get :show, id: inspection_request, format: :json }

      it { should respond_with(200) }
      it { expect(assigns(:inspection_request)).to be_kind_of(InspectionRequest) }
    end

    describe '#destroy' do
      let(:inspection_request) { FactoryGirl.create(:inspection_request) }

      before { delete :destroy, id: inspection_request, format: :json }

      it { should respond_with(204) }
      it { expect(assigns(:inspection_request)).to be_kind_of(InspectionRequest) }
    end

    describe '#new_inspection_requests'do
      let!(:inspection_requests) { 3.times { FactoryGirl.create(:inspection_request) } }
      let!(:viewed_inspection_requests) { 3.times { FactoryGirl.create(:viewed_inspection_request) } }

      before { get :new_inspection_requests, format: :json }

      it { should respond_with(200) }

      it 'contains 6 items' do
        expect(JSON.parse(response.body).size).to eq(3)
      end
    end

    describe '#mark_as_viewed' do
      let(:inspection_request) { FactoryGirl.create(:inspection_request) }

      before { put :mark_as_viewed, id: inspection_request, format: :json }

      it { should respond_with(204) }
      it { expect(assigns(:inspection_request)).to be_kind_of(InspectionRequest) }
    end
  end
end
