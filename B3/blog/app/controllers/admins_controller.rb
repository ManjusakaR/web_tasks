class AdminsController < ApplicationController

  def index
    if session[:admin_id]==nil
      render 'login'
    else
      render 'index'
    end
  end

  def login
    username=params[:admin][:username]
    password=params[:admin][:password]
    admin=Admin.find_by_username(username)
    if admin&&admin.password==password
      session[:admin_id]=admin.id
      render  'index'
    else
      session[:admin_id]=nil
      redirect_to admins_url
    end
  end

end
