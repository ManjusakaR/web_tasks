class AdminsController < ApplicationController
  $login_times=0
  $last_time=Time.now()
  $now=Time.now()

  def index
    if session[:admin_id]==nil
      @msg='please login in'
      render 'login'
    else
      render 'index'
    end
  end

  def login
    if $login_times<2
      username=params[:admin][:username]
      password=params[:admin][:password]
      admin=Admin.find_by_username(username)
      if admin&&admin.password==password
        session[:admin_id]=admin.id
        redirect_to  action: :index
      else
        $login_times+=1
        @msg="error "+$login_times.to_s+" times"
        $last_time=Time.now()
      end
    else
      $now=Time.now()
      if $now-$last_time>10
        $login_times=0
      else
        @msg="please wait 10s!"
      end
    end
  end

  def logout
    session[:admin_id]=nil
    redirect_to  action: :index
  end

end
