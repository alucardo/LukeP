class AddStudentIdToDivision < ActiveRecord::Migration
  def change
    add_column :divisions, :student_id, :integer
  end
end
