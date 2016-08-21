class CommentsController < ApplicationController
  def create
      @post = Post.find(params[:post_id])
      comment_params[:passed]=0
      @comment = @post.comments.create(comment_params)
      redirect_to wshow_url(@post.id)
    end

    def passed
      comment = Comment.find_by(id: params[:id])
      comment.update(passed: '1')
      @post = Post.find(comment.post_id)
      render 'posts/show'
    end



    private
      def comment_params
        params.require(:comment).permit(:email, :content)
      end

end
