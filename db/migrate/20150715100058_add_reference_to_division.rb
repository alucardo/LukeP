class AddReferenceToDivision < ActiveRecord::Migration
  def change
    change_table :divisions do |t|
      t.references :lesson, index: true, foreign_key: true
    end
  end
end
