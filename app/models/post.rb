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
end