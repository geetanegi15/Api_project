class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :role
      t.string :email
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
