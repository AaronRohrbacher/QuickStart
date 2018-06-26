class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :invoice_id
      t.string :description
      t.decimal :quantity
      t.decimal :price
      t.text :notes

      t.timestamps
    end
  end
end
