class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :roll_number
      t.string :city

      t.timestamps
    end
  end
end
