class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :start_date
      t.string :description

      t.timestamps
    end
  end
end
