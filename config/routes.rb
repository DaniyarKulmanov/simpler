# frozen_string_literal: true

Simpler.application.routes do
  get '/tests', 'tests#index'
  post '/tests', 'tests#create'
  # not reached because finds at 4 line
  get '/tests/:id', 'tests#show'
end
