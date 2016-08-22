class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin", only: :passed
  def create
      @post = Post.find(params[:post_id])
      comment_params[:passed]=0
      @comment = @post.comments.create(comment_params)
      redirect_to wshow_url(@post.id)
    end

    def passed
      if session[:admin_id]==nil
        render 'admin/index'
      else
        comment = Comment.find_by(id: comment_params[:id])
        comment.update(passed: '1')
        @post = Post.find(comment.post_id)
        render 'posts/show'
      end
    end

    def destroy_comment
      if session[:admin_id]==nil
        render 'admin/index'
      else
        comment = Comment.find_by(id: comment_params[:id])
        @post = Post.find(comment.post_id)
        Comment.destroy(comment.id)
        render 'posts/show'
      end
    end
    
    private
      def comment_params
        params.require(:comment).permit(:email, :content,:id)
      end

end
