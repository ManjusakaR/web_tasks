class PostsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin"

  def new
  end

  def create
    if session[:admin_id]==nil
      redirect_to admins_url
    else
      @post=Post.new(post_params)
      @post.save
      redirect_to posts_url
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
      redirect_to admins_url
    else
      Post.destroy(params[:id])
      @posts=Post.all
      redirect_to destroy_post_url
    end
  end

  private
    def post_params
      params.require(:post).permit(:title,:content,:p_type,:id)
    end

end
