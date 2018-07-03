class CreateTimeRecord < ActiveRecord::Migration[5.2]
  def change
    create_table :time_records do |t|
      t.integer :invoice_id
      t.date :date
      t.time :time
      t.decimal :rate
      t.string :punch_type, null: false
      t.boolean :add_to_notes, null: false, default: false
      t.boolean :added_to_line_items, default: false
    end
  end
end
