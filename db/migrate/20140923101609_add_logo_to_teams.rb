class AddLogoToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :logo, :binary
  end
end
