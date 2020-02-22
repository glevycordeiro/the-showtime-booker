class AddPriceToMovieSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_sessions, :price, :integer
  end
end
