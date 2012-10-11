# require 'spec_helper'
require File.expand_path("../../spec_helper", __FILE__)

#class Time
  #def self.now
    #Time.at 1212483780 # July 3 2008 9:03AM PST
  #end
#end

describe "Cache Buster Tags" do
  dataset :pages, :users

  let(:page){ pages(:home) }

  describe "<r:cache_buster />" do
    subject { page }
    it      { should render(%{<r:cache_buster />}).as(/\?[0-9]+$/) }
  end

end
