require File.expand_path('../../spec_helper', __FILE__)

describe CacheBuster do

  before(:all) do
    Radiant::Config['cache_buster.timeout'] = nil
  end

  let(:buster)  { CacheBuster.buster }
  let(:timeout) { CacheBuster.timeout }

  describe '.buster' do
    it 'should return cache buster' do
      buster.should be
    end
    it 'should be a string' do
      buster.should be_a_kind_of String
      buster.should match /^\?[0-9]+$/
    end
  end

  describe '.timeout' do
    describe 'without timeout config' do
      it 'should be an int' do
        timeout.should be_a_kind_of Fixnum
      end
    end
    describe 'with timeout config' do
      before do 
        Radiant::Config['cache_buster.timeout'] = 1
        @timeout = nil
      end

      it 'should be an int' do
        @timeout = timeout
        @timeout.should be_a_kind_of Fixnum
      end

      it 'should update after timeout passes' do
        sleep 1.1
        timeout.should be > @timeout
      end
    end
  end
end

