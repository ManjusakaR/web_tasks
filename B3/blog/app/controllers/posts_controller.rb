class PostsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin"

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

  def destroy_list
    @posts=Post.all
  end
  
  def blog_comments
    @posts=Post.all
  end


  def destroy
    if session[:admin_id]==nil
      render 'admin/index'
    else
      Post.destroy(params[:id])
      @posts=Post.all
      render 'destroy_list'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title,:content,:p_type,:id)
    end

end
