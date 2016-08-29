class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin", only: :passed
  def create
      @post = Post.find(params[:post_id])
      comment_params[:passed]=0
      @comment = @post.comments.create(comment_params)
    end

    def passed
      if session[:admin_id]==nil
        redirect_to admins_url
      else
        comment = Comment.find_by(id: comment_params[:id])
        comment.update(passed: '1')
        redirect_to post_url
      end
    end

    def destroy_comment
      if session[:admin_id]==nil
        redirect_to admins_url
      else
        comment = Comment.find_by(id: comment_params[:id])
        Comment.destroy(comment.id)
        redirect_to post_url
      end
    end

    private
      def comment_params
        params.require(:comment).permit(:email, :content,:id)
      end

end
