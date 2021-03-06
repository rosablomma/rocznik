Rails.application.routes.draw do
  resources :people
  resources :submissions
  resources :affiliations, only: [:new, :create, :destroy] do
    get :autocomplete_institution_name, on: :collection
    get :autocomplete_country_name, on: :collection
    get :autocomplete_department_name, on: :collection
  end
  resources :authorships, only: [:new, :create, :destroy]
  resources :reviews
  resources :article_revisions, only: [:new, :create, :destroy]

  devise_for :users
  mount Storytime::Engine => "/"
  root to: "blog_posts#index"
end
