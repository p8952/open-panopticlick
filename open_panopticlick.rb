require 'sinatra'

class OpenPanopticlick < Sinatra::Application
  
  get '/' do
    redirect to('/identify/')
  end

  get '/identify/?' do
    erb :identify
  end

end
