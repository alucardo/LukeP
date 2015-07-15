class AddReferenceToGrade < ActiveRecord::Migration
  def change
    change_table :grades do |t|
      t.references :subject, index: true, foreign_key: true
    end
  end
end
