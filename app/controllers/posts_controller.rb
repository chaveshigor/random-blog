class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @current_post = Post.find(param[:post_id])
    end

end
