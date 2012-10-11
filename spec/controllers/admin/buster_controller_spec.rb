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
      let(:before_count) { CacheBuster.count }
      before do
        post :index
      end

      it "should render the index view" do
        response.should be_success
        response.should render_template('index')
      end

      it "should have removed a cache buster" do
        CacheBuster.count.should == before_count-1
      end
    end
  end

  describe "all" do
    describe "reset all" do
      before do
        get :all
      end

      it "should render the index view" do
        response.should be_success
        response.should render_template('index')
      end

      it "should have destroyed all cache busters" do
        CacheBuster.count.should == 0
      end
    end
  end
end
