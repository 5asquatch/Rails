class CommentsController < ApplicationController
    def index
        @comments = Comment.includes(:post).order(created_at: :desc)
    end


    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        redirect_to post_path(@post) if @comment.save
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post) #if @comment.delete
    end

    def edit
        @comment = @post.comments.create(comment_params)
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end



private
def comment_params
    params.require(:comment).permit(:body, :author)
    
end

end