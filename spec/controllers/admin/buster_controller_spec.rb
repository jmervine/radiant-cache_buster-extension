require File.expand_path('../../../spec_helper', __FILE__)

describe Admin::BusterController do
  dataset :users

  before :all  do
    CacheBuster.create(:name => CacheBuster.master_buster, 
                       :timeout => CacheBuster.default_timeout, 
                       :buster => Time.now) unless CacheBuster.find_by_name(CacheBuster.master_buster)
  end

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
        @before_buster = CacheBuster.create(:name => "rspec_buster", :timeout => 1.minute, :buster => Time.now)
        post :index, :params => { :name => "rspec_buster" }
      end

      it "should render the index view" do
        response.should be_success
        response.should render_template('index')
      end

      it "should have removed a cache buster" do
        CacheBuster.find_by_name("rspec_buster").buster.should_not == @before_buster.buster
      end
    end
  end

  describe "all" do
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
