class WelcomeController < ApplicationController
  def index
      @posts=Post.all
  end

  def show
    id=params[:id]
    @post=Post.find_by_id(id)
  end

  def ptype
    @posts=Post.where(p_type: params[:p_type]).all
    render 'index'
  end
end
