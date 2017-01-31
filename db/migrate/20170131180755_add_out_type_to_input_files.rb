class AddOutTypeToInputFiles < ActiveRecord::Migration
  def change
    add_column :input_files, :out_type, :integer
  end
end
