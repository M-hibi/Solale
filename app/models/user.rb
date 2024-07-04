class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :notifications, dependent: :destroy

  GUEST_USER_EMAIL = "guest@example.com"

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = "guestuser"
      user.name = "guestuser"
    end
  end

  def active_for_authentication?
    super && (self.is_active == false)
  end

  def follow(user)
    active_follows.create(followed_id: user.id)
  end

  def unfollow(user)
    active_follows.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
