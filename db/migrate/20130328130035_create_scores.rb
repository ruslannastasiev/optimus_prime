class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team1_score
      t.integer :team2_score

      t.timestamps
    end
  end
end
