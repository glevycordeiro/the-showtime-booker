class AddTimesToMovieSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_sessions, :start_time, :time
  end
end
