class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        puts @post, 'aquiaquiaqui'
        puts comment_params, 'koé'
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter_name, :body)
        end
end
