class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def postsCounter
    user.increment!(:postsCounter)
  end
  def fiveRecentComments
    comments.order(created_at: :desc).limit(5)
  end
end
