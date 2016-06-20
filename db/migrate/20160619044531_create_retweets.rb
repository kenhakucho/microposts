class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :retweet, index: true
      t.references :tweet, index: true

      t.timestamps null: false
      
      t.index [:retweet_id, :tweet_id], unique: true
    end
  end
end
