class PostsController < ApplicationController
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
      redirect_to root_url
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
end

def destroy
end

def post_params
  params.require(:post).permit(:content)
end
end
