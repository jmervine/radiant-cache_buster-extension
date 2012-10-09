# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'
require 'compass'
require 'radiant-cache_buster-extension'

class CacheBusterExtension < Radiant::Extension
  version     RadiantCacheBusterExtension::VERSION
  description RadiantCacheBusterExtension::DESCRIPTION
  url         RadiantCacheBusterExtension::URL
  
  def activate
    tab 'Settings' do
      add_item "Cache Buster", "/admin/buster"
    end

    Page.class_eval do      
     include CacheBusterTags
   end
  end
end

