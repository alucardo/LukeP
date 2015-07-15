class DropTableKlass < ActiveRecord::Migration
  def change
    drop_table :klasses
  end
end
