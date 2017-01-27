class CreateInputFiles < ActiveRecord::Migration
  def change
    create_table :input_files do |t|
      t.string :inputfile

      t.timestamps
    end
  end
end
