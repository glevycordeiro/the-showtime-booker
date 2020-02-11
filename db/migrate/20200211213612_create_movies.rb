class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.string :genre
      t.integer :duration
      t.string :poster
      t.integer :age_limit
      t.string :imdb_url
      t.references :cinema, foreign_key: true

      t.timestamps
    end
  end
end
