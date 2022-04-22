class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :blind_date, null: false, foreign_key: true
      t.integer :leader_id
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
