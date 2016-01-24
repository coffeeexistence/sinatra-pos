require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  include Helpers

  def redirect_if_not_authorized!
    redirect '/login' unless Helpers.logged_in?(session)
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  	if Helpers.logged_in?(session)
      @user=Helpers.current_user(session)
      erb :'index'
    else
      erb :'user/login'
    end
  end
        
  get '/css/style.css' do
    File.read(File.join('public', 'css/style.css'))
  end

end