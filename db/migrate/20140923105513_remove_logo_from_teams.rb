class RemoveLogoFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :logo, :binary
  end
end
