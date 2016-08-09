require 'sinatra'
require 'active_record'
require 'mysql2'
require './model'

use Rack::Session::Pool, :expire_after => 120

get '/' do
  if session[:id] != nil
    @msg=Message.all
    erb :index
  else
    erb :login
  end
end

get '/index' do
  i=params[:mid]
  if session[:id] != nil
    if i==""
      @msg=Message.all
    else
      @msg=Message.where(:user_id => i).all
    end
    erb :index
  else
    erb :login
  end
end

post '/delete' do
  i=params[:mid]
  if Message.delete(i)
    @msg=Message.all
  else
    @msg="no such id"
  end
  erb :index
end

get '/exit' do
  session[:id]=nil
  erb :login
end

get '/login' do
  if session[:id]==nil
    uname=params['username']
    upwd=params['pwd']
    user=User.where(:username => uname, :password => upwd).first
    session[:id]=nil
    if user
      session[:id]=user.id
      @msg=Message.all
      erb :index
    else
      @msg=user.errors.messages
      erb :login
    end
  else
    erb :login
  end
end

get '/signup' do
  @u=User.new
  erb :signup
end

post '/signup' do
  uname=params[:username]
  upwd=params[:pwd]
    @u=User.new(:username => uname, :password => upwd)
    if @u.valid?
      @u.save
      erb :login
    else
        @msg=@u.errors.messages
      erb :signup
    end
end

get '/add' do
  erb :add
end

post '/add' do
  msg=params[:content]
  time=Time.now
  u = User.where(:id => session[:id]).first
  @m = Message.new( :content => msg,:user_id => session[:id],:created_at =>time )
  if @m.valid?
    @m.save
    u.message
    @m.user
    @msg=Message.all
    erb :index
  else
    @msg=@m.errors.messages
    erb :add
  end
end
