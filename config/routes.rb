Rails.application.routes.draw do
  root 'application#index'
  get '/task1', to: 'application#task1'
  get '/task1_questions', to: 'application#task1_questions'
  get '/task2', to: 'application#task2'
  get '/task2_questions', to: 'application#task2_questions'
end
