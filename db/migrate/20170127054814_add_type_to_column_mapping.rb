class AddTypeToColumnMapping < ActiveRecord::Migration
  def change
    add_column :column_mappings, :type, :integer
    rename_column :column_mappings, :inp_col_title, :col_title
  end
end
