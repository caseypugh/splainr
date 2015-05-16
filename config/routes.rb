Splainr::Application.routes.draw do

  get '/mansplainr-call', to: 'home#mansplainr_call'
  post '/mansplainr-call', to: 'home#mansplainr_call'

  get '/mansplainr-response', to: 'home#mansplainr_response'
  post '/mansplainr-response', to: 'home#mansplainr_response'

  root to: 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
