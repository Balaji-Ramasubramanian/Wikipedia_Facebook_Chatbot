class CreateUser < ActiveRecord::Migration[5.2]
 
 # Creating new users table
  def up
  	create_table :users do |t|
  		t.string :facebook_userid
  		t.string :locale
  		t.boolean :featured_article_subscription
  		t.boolean :image_of_the_day_subscription
  		t.boolean :on_this_day_subscription
  		t.boolean :news_subscription
  	end
  end

  # Dropping the table
  def down
  	drop_table :users
  end
end
