class AddUserIdToChampionships < ActiveRecord::Migration
  def change
    add_column :championships, :user_id, :integer
  end
end
