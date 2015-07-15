class AddReferenceToSubject < ActiveRecord::Migration
  def change
    change_table :subjects do |t|
      t.references :lesson, index: true, foreign_key: true
    end
  end
end
