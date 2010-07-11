class CreateMatchesTeams < ActiveRecord::Migration
  def self.up
    create_table :matches_teams, :id => false do |t|
      t.integer :team_id
      t.integer :match_id

      t.timestamps
    end
  end

  def self.down
    drop_table :matches_teams
  end
end
