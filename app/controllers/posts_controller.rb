class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
   @posts = Post.all
  end
  def new
   @post=Post.new
  end
  def create
   @post =Post.new(post_params)
   if params[:back]
         render :new
    else
    if @post.save
       redirect_to posts_path, notice: "投稿を作成しました！"
     else
       render :new
     end
   # Post.create(post_params)
   # redirect_to new_post_path
  end
  def show
  # @post = Post.find(params[:id])
  end
  def edit
  # @post = Post.find(params[:id])
  end
  def update
  # @post = Post.find(params[:id])
     if @post.update(post_params)
     redirect_to posts_path, notice: "投稿を編集しました！"
     else
     render :edit
     end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end

end
