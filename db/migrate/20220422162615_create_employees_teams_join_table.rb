class CreateEmployeesTeamsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :employees, :teams do |t|
      t.index [:employee_id, :team_id]
      t.index [:team_id, :employee_id]
    end
  end
end
