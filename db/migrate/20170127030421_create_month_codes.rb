class CreateMonthCodes < ActiveRecord::Migration
  def change
    create_table :month_codes do |t|
      t.integer :month_number
      t.string :put_or_call
      t.string :month_code

      t.timestamps
    end
  end
end
