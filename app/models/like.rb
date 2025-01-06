class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  def likesCounter
    post.increment!(:likesCounter)
  end
end
