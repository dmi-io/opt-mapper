class RenameTypeInColumnMapping < ActiveRecord::Migration
  def change
    rename_column :column_mappings, :type, :col_type
  end
end
