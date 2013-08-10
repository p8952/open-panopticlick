require 'digest/md5'
require 'sinatra'
require 'useragent'

$id_vars = Hash.new
$id_vars[:os] = 0
$id_vars[:platform] = 0
$id_vars[:browser] = 0
$id_vars[:version] = 0
$id_vars[:build] = 0
$id_vars[:localization] = 0

class OpenPanopticlick < Sinatra::Application
  
  get '/' do
    redirect to('/identify/')
  end

  get '/identify/?' do
    erb :identify
  end

end
