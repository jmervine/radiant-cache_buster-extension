require File.expand_path('../../../spec_helper', __FILE__)

describe Admin::BusterController do
  dataset :users

  before :each do
    ActionController::Routing::Routes.reload
    login_as :designer
  end
  
  it "should be a ResourceController" do
    controller.should be_kind_of(Admin::ResourceController)
  end

  it "should handle CacheBuster" do
    controller.class.model_class.should == CacheBuster
  end

  describe "index" do
    describe "display Buster" do
      before do
        get :index
      end

      it "should render the index view" do
        response.should be_success
        response.should render_template('index')
      end
    end

    describe "update Buster" do
      before do
        post :index
      end

      it "should render the index view" do
        response.should be_success
        response.should render_template('index')
      end
    end
  end
end

