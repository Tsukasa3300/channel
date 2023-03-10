class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]
  
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @posts = @user.posts
    if logged_in?
      @post  = current_user.posts.build
    end
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "登録完了"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

  def new
    @user = User.new
  end


  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
