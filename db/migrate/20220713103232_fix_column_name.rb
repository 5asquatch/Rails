class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :follower_id, :followee_id
    rename_column :follows, :followed_user_id, :follower_id
  end
end
