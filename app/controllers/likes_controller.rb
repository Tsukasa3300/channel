class LikesController < ApplicationController
    def create
      post_id = params[:like][:post_id]
        post = Post.find(params[:post_id])
        current_user.like(post)
        redirect_to root_url
      end
     
      def destroy
        post = current_user.likes_posts.find(params[:post_id])
        current_user.unlike(post)
        
      end
end
