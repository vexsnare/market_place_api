require 'api_constraints'

Rails.application.routes.draw do

  mount SabisuRails::Engine => "/sabisu_rails"

  namespace :api, defaults: { format: :json },
             path: '/' do
    devise_for :users
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do



      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]

    end
    # We are going to list our resources here
  end
end
