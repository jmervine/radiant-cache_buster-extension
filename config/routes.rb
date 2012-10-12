ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :buster
    #map.namespace :buster do |buster|
      #buster.resources :add
    #end
  end
end

