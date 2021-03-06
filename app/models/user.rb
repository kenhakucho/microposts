class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
#  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    email: true,
                    length: { maximum: 255 },
#                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :birthday, absence: true, on: :create
  validates :birthday_before_type_cast, allow_blank: true, 
    format: {with: /[0-2]{1}[0-9]{3}-[0-1][0-9]-[0-3][0-9]/}, on: :update

  validates :area, absence: true, on: :create
  validates :area, allow_blank: true, numericality: true, on: :update

  has_secure_password
  has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :microposts
  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower

  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end

  def following?(other_user)
    following_users.include?(other_user)
  end
  
  def feed_items
    Micropost.where(user_id: following_user_ids + [self.id])
  end
end
