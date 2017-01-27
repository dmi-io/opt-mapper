class CreateColumnMappings < ActiveRecord::Migration
  def change
    create_table :column_mappings do |t|
      t.string :inp_col_title

      t.timestamps
    end
  end
end
