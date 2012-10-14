require File.expand_path("../../spec_helper", __FILE__)

describe "Cache Buster Tags" do
  dataset :pages, :users

  let(:page){ pages(:home) }

  describe "<r:cache_buster />" do
    subject { page }
    it { 
      should render(%{<r:cache_buster />}).as(/\?[0-9]+$/) 
    }
  end

  describe "<r:cache_buster name='...' timeout='...' />" do
    before do
      foo = CacheBuster.find_by_name("foo")
      foo.destory unless foo.nil?
    end
    subject { page }
    it { 
      CacheBuster.find_by_name("foo").should be_nil
      should render(%{<r:cache_buster name="foo" timeout="1" />}).as(/\?[0-9]+$/) 
      CacheBuster.find_by_name("foo").should_not be_nil
    }
  end

end
