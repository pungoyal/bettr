class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.belongs_to :match
      t.belongs_to :team
      t.belongs_to :user
      t.integer :points
      t.boolean :success, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bets
  end
end
