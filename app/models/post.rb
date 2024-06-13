class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :notification, as: :subject, dependent: :destroy

  validates :image, presence: true


  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def reported_by?(user)
    reports.exists?(user_id: user.id)
  end

  def save_tags(savepost_tags)
    if self.tags.present?
      self.tags.delete(tags)
    end
    savepost_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end

end