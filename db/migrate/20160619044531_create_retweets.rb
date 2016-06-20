class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :retweet_id, index: true
      t.references :tweet_id, index: true

      t.timestamps null: false
      
      t.index [:tweet_id, :retweet_id], unique: true
    end
  end
end
