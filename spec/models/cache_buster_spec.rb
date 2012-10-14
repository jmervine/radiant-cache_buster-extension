require File.expand_path('../../spec_helper', __FILE__)

describe CacheBuster do

  before(:all) do
    # ensure default after previous tests
    Radiant::Config['cache_buster.timeout'] = 1.day
    @cache_buster = CacheBuster.create(:name => "rspec_buster_1", :timeout => 1.minute, :buster => Time.now)
  end

  describe '.buster!' do
    describe "without attributes" do
      it 'should return cache buster' do
        @cache_buster.buster!.should be
      end
      it 'should be a string' do
        @cache_buster.buster!.should be_a_kind_of String
        @cache_buster.buster!.should match /^\?[0-9]+$/
      end
    end
  end

end
