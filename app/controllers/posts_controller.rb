class PostsController < ApplicationController
  validates :title, :body, presence: true

  def index
    # Return all `Post`
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # Add a new `Post` to the database
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    # Remove a `Post` from the database
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
