ActionController::Routing::Routes.draw do |map|
  map.resources :tasks,
    :member => { 
      :dupe => :get, 
      :schedule => :put
    }
  map.resources :main
  map.redirect "/servants/redirect/:id", :controller => "servants", :action => "redirect"
  map.resources :servants
  map.root :controller => "main"
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
