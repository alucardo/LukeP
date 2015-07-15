class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :division, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
