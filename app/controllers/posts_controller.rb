class PostsController < ApplicationController
    def index
        @posts = Post.includes(:user).all.order(created_at: :desc)
    end

    def new 
        @post = Post.new 
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
        redirect_to post_path(@post)
        else
            render :new
        end
    end

    def show 
        @post = Post.find(params[:id])
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update 
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.destroy(params[:id])
        redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :photo, :likes)
    end



    
end
