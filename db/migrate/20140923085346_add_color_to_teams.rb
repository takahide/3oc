class AddColorToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :color, :integer
  end
end
