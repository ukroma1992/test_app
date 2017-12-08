class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :team_id
      t.integer :tournament_id

      t.timestamps
    end

    add_index :members, [:team_id, :tournament_id], unique: true

  end
end
