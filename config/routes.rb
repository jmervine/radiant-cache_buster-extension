ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.buster 'admin/buster', 
      :controller => :buster, 
      :action => :index, 
      :conditions => { :method => [ :get, :post ] }
    admin.bust_all 'admin/buster/all', 
      :controller => :buster, 
      :action => :all, 
      :conditions => { :method => [ :get ] }
  end
end
