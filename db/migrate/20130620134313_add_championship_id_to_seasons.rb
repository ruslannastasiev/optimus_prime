class AddChampionshipIdToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :championship_id, :integer
  end
end
