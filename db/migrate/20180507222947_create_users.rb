class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_id
      t.string :oauth_token
      t.string :oauth_secret_token
    end
  end
end
