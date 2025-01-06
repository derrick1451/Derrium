class AddDefaultToCommentsCounter < ActiveRecord::Migration[7.2]
  def change
    change_column_default :posts, :commentsCounter, 0
    change_column_default :posts, :likesCounter, 0
  end
end
