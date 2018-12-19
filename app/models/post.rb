class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true

  def self.search(search)
    if search
      post = Post.find_by(title: search)
      if post
        self.where(title: post)
      else
        Post.all
      end
    else
      Post.all
    end
  end
end
