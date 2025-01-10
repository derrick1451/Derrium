class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def posts_counter
    user.increment!(:postsCounter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
