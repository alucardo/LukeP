class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :grade

      t.timestamps null: false
    end
  end
end
