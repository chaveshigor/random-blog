class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @all_posts = Post.all.order(created_at: 'desc')
    end

    def show
        @current_post = Post.find(params[:id])
        total_views = @current_post[:views] + 1
        @current_post.update(views: total_views)
    end

    def new
        @new_post = Post.new
    end

    def create
        @new_post = Post.new(post_params)
        @new_post[:user_id] = current_user[:id] if current_user.present?
        
        if @new_post.save
            redirect_to post_path(@new_post)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def post_params
            puts params
            params.require(:post).permit(:title, :description, :body)
        end
end
