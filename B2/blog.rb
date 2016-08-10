require 'sinatra'
require 'active_record'
require 'mysql2'
require './model'

use Rack::Session::Pool, :expire_after => 120

get '/' do
  if session[:id] != nil
    @msg=Message.order("id desc")
    #@msg=Message.all
    erb :index
  else
    erb :login
  end
end

get '/index' do
  i=params[:username]
  if session[:id] != nil
    if i==""
      @msg=Message.order("id desc")
      #@msg=Message.all
    else
      #Message.order("id desc")
      id=User.where(username: i).first
      @msg=Message.order("id desc").where(user_id: id).all
      #@msg=id.messages
    end
    erb :index
  else
    erb :login
  end
end

post '/delete' do
  i=params[:mid]
  if Message.destroy_all(id: i)
    @msg=Message.order("id desc")
    #@msg=Message.all
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
    user=User.where(username:  uname, password: upwd).first
    session[:id]=nil
    if user
      session[:id]=user.id
      @msg=Message.order("id desc")
      #@msg=Message.all
      erb :index
    else
      if user.errors.any?
        @msg=user.errors.messages
      else
        @msg=nil
      end
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
    @u=User.new(username:  uname, password: upwd)
    if @u.valid?
      @u.save
      erb :login
    else
      if @u.errors.any?
        @msg=@u.errors.messages
      else
        @msg=nil
      end
      erb :signup
    end
end

get '/add' do
  erb :add
end

post '/add' do
  msg=params[:content]
  time=Time.now
  u = User.find(session[:id])
  @m = Message.new( content: msg,user_id: session[:id],created_at: time )
  if @m.valid?
    @m.save
    u.message
    @m.user
    @msg=Message.order("id desc")
    #@msg=Message.all
    erb :index
  else
    if @m.errors.any?
      @msg=@m.errors.messages
    else
      @msg=nil
    end
    erb :add
  end
end
