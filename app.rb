require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    p ENV

    @peeps = Peep.all
    erb :"chitter/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
  # create the user and then...
    redirect '/peeps'
  end

  run! if app_file == $0
end
