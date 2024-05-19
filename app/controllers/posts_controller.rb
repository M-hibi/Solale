class PostsController < ApplicationController
  
  def index
    	@posts = Post.all
    	@post = Post.new
  end
  
  def show
    	@post = Post.find(params[:id])
    	@user = @post.user_id
  end
  
  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
    if @post.save
      flash[:notice] = "You posted Solale"
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
  		render :index
    end    
  end
  
  def edit
  	@post = Post.find(params[:id])
    unless @post.user.id == current_user.id
    redirect_to posts_path
    end  
  end

  def destroy
  	post = Post.find(params[:id])
  	 post.destroy
  	redirect_to posts_path
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post),notice:"You edited Solale"
    else
    render:edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, :post_tag_id)
  end
  
end

