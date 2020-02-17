require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    'Chitter'
  end

  get '/users/new' do
    'Sign up to Chitter'
  end

  run! if app_file == $0
end
