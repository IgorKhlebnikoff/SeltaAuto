require 'spec_helper'

RSpec.describe AutopartsController, :type => :controller do
  describe "index action" do
    let!(:autopart) { FactoryGirl.create(:autopart) }
    before { get :index, format: :json }

    it "action index for @autoparts" do
      expect(assigns(:autoparts)).to include(autopart)
    end
    it "action to respond template index" do
      expect(response.status).to eq(200)
    end
    it "action to respond template index" do
      autopart = {part_number: 'some number', made_by: 'some made' }
      expect(assigns(:autoparts)).to be
    end
  end


  describe "#new" do
    before {get :new, format: :html}
    it "renders template new" do
      expect(response).to render_template(:new)
    end
    it "set's autopart not nill" do
      expect(assigns(:autopart)).to be_kind_of(Autopart)
    end

  end

end