Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'api/v1/registrations'
}

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end

      get 'list_vacancies', to: 'vacancies#list_vacancies', as: 'list_vacancies'
      get 'see_vacancy/:id', to: 'vacancies#see_vacancy', as: 'see_vacancy'
    end
  end
end
