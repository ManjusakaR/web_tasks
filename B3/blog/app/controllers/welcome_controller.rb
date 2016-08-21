class WelcomeController < ApplicationController
  def index
      @posts=Post.all
  end

  def show
    id=params[:id]
    @post=Post.find_by_id(id)
  end
end
