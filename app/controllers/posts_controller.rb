class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  before_action :logged_in_user, only: [:index, :destroy, :create]
  def index
  @posts=Post.all
end

def show
  @post=Post.find(params[:id])
  @comments = @post.comments
  if logged_in?
    @comment = current_user.comments.build
  end 
end

def create
  @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to request.referer
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
end

def destroy
  @post.destroy
        flash[:success] = "投稿を削除しました"
        if request.referrer.nil?
          redirect_to root_url, status: :see_other
        else
          redirect_to request.referrer, status: :see_other
        end
end

def post_params
  params.require(:post).permit(:content)
end


def correct_user
  @post = current_user.posts.find_by(id: params[:id])
  redirect_to root_url, status: :see_other if @post.nil?
end
end
