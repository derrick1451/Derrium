class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :name, presence: true
    validates :postsCounter, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0 }
    def threeRecentPosts
        posts.order(created_at: :desc).limit(3)
    end
end