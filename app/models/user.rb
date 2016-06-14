class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :birthday, absence: true, on: :create
  validates :birthday, allow_blank: true, format: {with: /[0-2]{1}[0-9]{3}-[0-1][0-9]-[0-3][0-9]/}, on: :update
  validates :area, absence: true, on: :create
  validates :area, allow_blank: true, numericality: true, on: :update

  has_secure_password
  has_many :microposts
end
