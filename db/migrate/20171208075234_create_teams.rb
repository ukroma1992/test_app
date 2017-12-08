class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.string :photo

      t.timestamps
    end

    add_index :teams, :name, unique: true

  end
end
