class AddViewsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :views, :integer
  end
end
