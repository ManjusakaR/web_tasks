class AdminsController < ApplicationController
  $login_times=0
  $last_time=Time.now()
  $now=Time.now()

  def index
    if session[:admin_id]==nil
      @msg=''
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
        render  'index'
      else
        $login_times+=1
        @msg="error "+$login_times.to_s+" times"
        $last_time=Time.now()
        session[:admin_id]=nil
        render 'login'
      end
    else
      $now=Time.now()
      if $now-$last_time>10
        $login_times=0
        render 'login'
      else
        @msg="please wait 180s!"
        render 'login'
      end
    end
  end

  def logout
    session[:admin_id]=nil
    render 'login'
  end

end
