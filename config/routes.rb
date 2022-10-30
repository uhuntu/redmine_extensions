# Engine routes
TesRedmineExtensions::Engine.routes.draw do
  resources :easy_settings, except: :destroy
end

# Redmine routes
Rails.application.routes.draw do
  mount TesRedmineExtensions::Engine => '/tes_redmine_extensions'

  resources :easy_settings, except: :destroy
end
