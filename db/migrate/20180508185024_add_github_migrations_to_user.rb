class AddGithubMigrationsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :followers, :integer
    add_column :users, :following, :integer
    add_column :users, :starred, :string
  end
end
