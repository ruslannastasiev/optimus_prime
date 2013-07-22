class AddSeasonIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :season_id, :integer
  end
end
