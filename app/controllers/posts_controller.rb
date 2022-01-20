class PostsController < ApplicationController
    def index
        @all_posts = Post.all.order(created_at: 'desc')
    end

    def show
        @current_post = Post.find(param[:post_id])
    end

end
