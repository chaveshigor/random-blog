require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /index" do

    
    it "get all the posts ordered by desc created_at" do
      new_user = User.create(email: 'test@mail.com', first_name: 'batman', last_name: 'robin', birthday: Date.today, password: '123456')
      post = Post.create(title: 'i like cats', body: 'they are cute', description: 'but they eat a lot', user_id: new_user[:id])
      get :index
      expect(assigns(:all_posts)).to eq([post])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
