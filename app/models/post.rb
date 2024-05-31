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
    savepost_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end
  
  def update_tags(latest_tags)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - latest_tags
    new_tags = latest_tags - current_tags
    old_tags.each do |old_tag|
      tag = self.tags.find_by(name: old_tag)
      self.tags.delete(tag) if tag.present?
    end
    new_tags.each do |new_tag|
      self.tags.find_or_create_by(name: new_tag)
    end
  end      
end
