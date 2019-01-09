Rails.application.routes.draw do
  root 'application#index'
  get '/task1', to: 'application#task1'
  get '/task1_questions', to: 'application#task1_questions'
end
