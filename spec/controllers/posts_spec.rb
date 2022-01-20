require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    
    before(:each) do
        @new_user = User.create(email: 'test@mail.com', first_name: 'batman', last_name: 'robin', birthday: Date.today, password: '123456')
        @post1 = Post.create(title: 'i like cats', body: 'they are cute', description: 'but they eat a lot', user_id: @new_user[:id])
    end

    after(:all) do
        User.destroy_all
        Post.destroy_all
    end

    describe "GET /index" do
        
        it "get all the posts ordered by desc created_at" do
            post2 = Post.create(title: 'i hate cats', body: 'they are small', description: 'and they eat a lot', user_id: @new_user[:id])
            get :index
            expect(assigns(:all_posts)).to eq([post2, @post1])
            expect(response).to render_template("index")
        end        
    end

    describe "GET /show" do

        it "get a single post" do
            get :show, params: {id: @post1[:id]}
            
            expect(response).to render_template("show")
            expect(assigns(:current_post)).to eq(@post1)
        end
    end
end
