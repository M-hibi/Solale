class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.page(params[:page]).order(created_at: :desc)
    @notifications = current_user.notifications.order(created_at: :desc)
    @notifications.where(checked: false).each do |notification|
    notification.update(checked: true)
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user_id
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_names].split(',')
    if @post.save
      @post.save_tags(tag_list)
      redirect_to posts_path, notice: "Solaleを投稿しました"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_names].split(',')
    if @post.update(post_params)
      @post.save_tags(tag_list)
      redirect_to post_path(@post.id), notice: "Solaleを編集しました"
    else
      render :edit
    end
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
      if current_user ==  admin
  	    redirect_to request.referer, notice: "投稿を削除しました"
      else
        redirect_to request.referer, notice: "Solaleとさよならしました"
      end
  end

  def search
      @tag = params[:tag]
      @posts = Post.page(params[:page]).joins(:tags).where('name LIKE ?',"#{@tag}")
  end


  private

  def post_params
    params.require(:post).permit(:image).merge(user_id:current_user.id)
  end


end
