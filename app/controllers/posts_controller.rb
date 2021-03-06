class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :delete]
   def index
        @posts = Post.all.reverse
   end

   def show
   end

   def new
        @post = Post.new
   end

   def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
   end

   def edit
   end

   def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash[:error] = @post.errors.full_messages
            render :edit
        end
   end

   def destroy
        @post.delete
        redirect_to user_path(@user)
   end

   private

   def post_params
        params.require(:post).permit(:user_id, :photo, :caption)
   end

   def find_post
        @post = Post.find(params[:id])
   end
end
