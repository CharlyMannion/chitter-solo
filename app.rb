require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash


  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :"chitter/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  # post '/sessions' do
  #   user = User.authenticate(email: params[:email], password: params[:password])
  #   session[:user_id] = user.id
  #   redirect('/peeps')
  # end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Incorrect email or password, please try again'
      redirect('/sessions/new')
    end
  end


  run! if app_file == $0
end
