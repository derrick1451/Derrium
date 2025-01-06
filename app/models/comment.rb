class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post 
def commentsCounter
    post.increment!(:commentsCounter)
  end
end
