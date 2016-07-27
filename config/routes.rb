# == Route Map
#
#      Prefix Verb   URI Pattern                Controller#Action
#       areas GET    /areas(.:format)           areas#index
#             POST   /areas(.:format)           areas#create
#    new_area GET    /areas/new(.:format)       areas#new
#   edit_area GET    /areas/:id/edit(.:format)  areas#edit
#        area GET    /areas/:id(.:format)       areas#show
#             PATCH  /areas/:id(.:format)       areas#update
#             PUT    /areas/:id(.:format)       areas#update
#             DELETE /areas/:id(.:format)       areas#destroy
#      motels GET    /motels(.:format)          motels#index
#             POST   /motels(.:format)          motels#create
#   new_motel GET    /motels/new(.:format)      motels#new
#  edit_motel GET    /motels/:id/edit(.:format) motels#edit
#       motel GET    /motels/:id(.:format)      motels#show
#             PATCH  /motels/:id(.:format)      motels#update
#             PUT    /motels/:id(.:format)      motels#update
#             DELETE /motels/:id(.:format)      motels#destroy
# rails_admin        /admin                     RailsAdmin::Engine
#  home_index GET    /home(.:format)            home#index
#    products GET    /products(.:format)        products#index
#        root GET    /                          products#index
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
#

Rails.application.routes.draw do
  resources :areas
  resources :motels
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :home, only: [:index]

  resources :products, only: [:index]

  root 'products#index'
end
