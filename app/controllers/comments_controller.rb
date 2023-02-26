class CommentsController < ApplicationController
  before_action :correct_user,   only: :destroy

    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.build(comment_params)
          if @comment.save
            flash[:success] = "コメントしました"
            redirect_to [@post]
          else
            redirect_to request.referrer, status: :see_other
          end
      end
    
      def destroy
        @comment.destroy
        flash[:success] = "コメントを削除しました"
        if request.referrer.nil?
          redirect_to root_url, status: :see_other
        else
          redirect_to request.referrer, status: :see_other
        end
      end
    
      def comment_params
        params.require(:comment).permit(:content).merge(post_id: params[:post_id])
      end

      def correct_user
        @comment = current_user.comments.find_by(id: params[:id])
        redirect_to root_url, status: :see_other if @comment.nil?
      end
end
