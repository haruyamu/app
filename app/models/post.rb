class Post < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
  validates :title
  validates :place
  validates :content
  validates :image
  end
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes,source: :user
   def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
