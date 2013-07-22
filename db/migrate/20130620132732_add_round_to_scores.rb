class AddRoundToScores < ActiveRecord::Migration
  def change
    add_column :scores, :round, :integer
  end
end
