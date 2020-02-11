class CreateMovieSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :movie, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
