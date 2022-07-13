class FixColumnName2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :follower_i, :follower_id
  end
end
