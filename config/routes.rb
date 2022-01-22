Rails.application.routes.draw do
  root 'home#index'
  post "/links" => 'links#create'

  get "/:lookup_code" => "links#show"

end
