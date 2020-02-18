class AddStatusToMovieSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_sessions, :status, :boolean
  end
end
