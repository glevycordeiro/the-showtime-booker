class CreateCinemas < ActiveRecord::Migration[5.2]
  def change
    create_table :cinemas do |t|
      t.references :user, foreign_key: true
      t.text :address
      t.string :name

      t.timestamps
    end
  end
end
