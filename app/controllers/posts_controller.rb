class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      FormMailer.with(form: @post).new_form_email.deliver_later
      redirect_to '/', notice: 'Post was successfully created'
    else
      redirect_to '/', notice: 'Post was not successfully created'
    end
  end

  private

  def post_params
    # params.require(:post).permit(:name, :email, :message)
    params.fetch(:post, {}).permit(:name, :email, :message)
  end
end
