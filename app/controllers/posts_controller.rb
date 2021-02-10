class PostsController < ApplicationController
  def index
   @posts = Post.all
  end
  def new
   @post=Post.new
  end
  def create
   @post =Post.new(post_params)

    if @post.save
       # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
       redirect_to blogs_path, notice: "投稿を作成しました！"
     else
       # 入力フォームを再描画します。
       render :new
     end

   # Post.create(post_params)
   # redirect_to new_post_path
  end
  def show
  @post = Post.find(params[:id])
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end

end
