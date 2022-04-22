class CreateBlindDates < ActiveRecord::Migration[6.1]
  def change
    create_table :blind_dates do |t|
      t.date :lunch_date

      t.timestamps
    end
  end
end
