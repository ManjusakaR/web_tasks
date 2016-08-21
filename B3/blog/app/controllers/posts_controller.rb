class PostsController < ApplicationController

  def new
  end

  def create
    if session[:admin_id]==nil
      render 'admin/index'
    else
      @post=Post.new(post_params)
      @post.save
      @posts=Post.all
      render 'index'
    end
  end

  def index
    @posts=Post.all
  end

  def show
    @post=Post.find_by_id(params[:id])
  end

  def destroy
    Post.destroy(params[:id])
    @posts=Post.all
    render 'index'
  end

  private
    def post_params
      params.require(:post).permit(:title,:content)
    end

end
