class AddDefaultToPostCounter < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :postsCounter, 0
  end
end
