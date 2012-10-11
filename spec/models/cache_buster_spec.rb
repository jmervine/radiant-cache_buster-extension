require File.expand_path('../../spec_helper', __FILE__)

describe CacheBuster do

  before(:all) do
    # ensure default after previous tests
    Radiant::Config['cache_buster.timeout'] = 1.day
  end

  describe '.buster!' do
    describe "without attributes" do
      it 'should return cache buster' do
        CacheBuster.buster!.should be
      end
      it 'should be a string' do
        CacheBuster.buster!.should be_a_kind_of String
        CacheBuster.buster!.should match /^\?[0-9]+$/
      end
    end

    describe "with name" do
      it 'should return cache buster' do
        CacheBuster.buster!("spec1").should be
      end
      it 'should be a string' do
        CacheBuster.buster!("spec1").should be_a_kind_of String
        CacheBuster.buster!("spec1").should match /^\?[0-9]+$/
      end
    end

    describe "with name and timeout" do
      it 'should return cache buster' do
        CacheBuster.buster!("spec2", 1.minute).should be
      end
      it 'should be a string' do
        CacheBuster.buster!("spec2", 1.minute).should be_a_kind_of String
        CacheBuster.buster!("spec2", 1.minute).should match /^\?[0-9]+$/
      end
    end
  end

end

