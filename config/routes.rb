ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :buster
  end
end
#ActionController::Routing::Routes.draw do |map|
  #map.connect '/admin/buster', :controller => :buster, :action => :index, :conditions => { :method => [ :get, :post ] }
#end


