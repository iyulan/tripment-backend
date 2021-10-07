# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :procedures, only: [] do
      get :search, on: :collection
    end
  end
end
