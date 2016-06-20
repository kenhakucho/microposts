class Retweet < ActiveRecord::Base
  belongs_to :retweet_id, class_name: "Micropost"
  belongs_to :tweet_id, class_name: "Micropost"
end
