require 'digest/md5'
require 'json'
require 'redis'
require 'sinatra'
require 'useragent'

if ENV["REDISCLOUD_URL"]
  uri = URI.parse(ENV["REDISCLOUD_URL"])
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  $redis = Redis.new(:host => "127.0.0.1", :port => 6379)
end

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
