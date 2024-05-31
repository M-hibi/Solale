class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, uniqueness: {scope: :post_id}

  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, user: self.post.user, action_type: :liked_to_own_post)
  end
end
