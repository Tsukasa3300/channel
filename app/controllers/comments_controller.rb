class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.build(comment_params)
          if @comment.save
            flash[:success] = "コメントしました"
            redirect_to [@post]
          else
            redirect_to root_url
          end
      end
    
      def destroy
      end
    
      def comment_params
        params.require(:comment).permit(:content).merge(post_id: params[:post_id])
      end
end
