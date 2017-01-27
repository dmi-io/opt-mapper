class AddMappingTypeToColumnMapping < ActiveRecord::Migration
  def change
    add_column :column_mappings, :mapping_type, :string
  end
end
