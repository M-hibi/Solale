class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :reports, dependent: :destroy  

  validates :image, presence: true
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end  
  
end
