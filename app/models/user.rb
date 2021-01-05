class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :comments
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         validates :name,presence: true, length: { maximum: 8 }
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
