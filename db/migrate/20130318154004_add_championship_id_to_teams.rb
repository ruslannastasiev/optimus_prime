class AddChampionshipIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :championship_id, :integer
  end
end
