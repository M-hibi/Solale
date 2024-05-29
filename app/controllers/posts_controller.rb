class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
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
      redirect_to posts_path, success: t('Solaleを投稿しました')
    else
      render :new
    end
  end
    
  def edit
    @post = Post.find(params[:id])
    @tags = @post.tags.pluck(:name).join(',')
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end  
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
    redirect_to request.referer, success: t('Solaleとさよならしました')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:image][:tag_ids].split(',')
    if @post.update(post_params)
      @post.update_tags(tag_list)
      redirect_to root_path, success: t('Solaleを編集しました')
    else
      render :edit
    end
  end

  
  def search 
      @tag = params[:tag]
      @posts = Post.joins(:tags).where('name LIKE ?',"#{@tag}")
  end


  private
  
  def post_params
    params.require(:post).permit(:image).merge(user_id:current_user.id)
  end
end
