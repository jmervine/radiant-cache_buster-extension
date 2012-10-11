require File.expand_path('../../spec_helper', __FILE__)

describe CacheBuster do

  before(:all) do
    # ensure default after previous tests
    Radiant::Config['cache_buster.timeout'] = CacheBuster::DEFAULT_TIMEOUT
  end

  describe '.buster' do
    it 'should return cache buster' do
      CacheBuster.buster.should be
    end
    it 'should be a string' do
      CacheBuster.buster.should be_a_kind_of String
      CacheBuster.buster.should match /^\?[0-9]+$/
    end
  end

  describe '.timeout' do
    describe 'without timeout config' do
      it 'should be an int' do
        CacheBuster.timeout.should be_a_kind_of Fixnum
      end
    end
    describe 'with timeout config' do
      before do
        Radiant::Config['cache_buster.timeout'] = 1
      end
      it 'should be an int' do
        CacheBuster.timeout.should be_a_kind_of Fixnum
        CacheBuster.timeout.should == 1
      end

      it 'should update after timeout passes' do

        buster1 = CacheBuster.buster
        sleep 2
        buster2 = CacheBuster.buster

        buster1.should_not == buster2
        #buster1.gsub("?", "").to_i.should be_less_then buster2.gsub("?", "").to_i
      end
    end
  end
end

