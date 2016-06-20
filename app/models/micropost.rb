class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  has_many :retweeting_relationships, class_name:  "Retweet",
                                     foreign_key: "retweet_id",
                                     dependent:   :destroy
  has_many :retweeting_microposts, through: :retweeting_relationships, source: :tweet

  has_many :tweeting_relationships, class_name:  "Retweet",
                                    foreign_key: "tweet_id",
                                    dependent:   :destroy
  has_many :retweet_microposts, through: :tweeting_relationships, source: :retweet

  def retweet(other_micropost)
    retweeting_relationships.find_or_create_by(tweet_id: other_micropost.id)
  end

  def following?(other_user)
    following_users.include?(other_user)
  end
end
