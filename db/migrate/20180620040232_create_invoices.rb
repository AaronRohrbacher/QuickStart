class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :company_id
      t.boolean :paid, default: false
      t.date :due_date
    end
  end
end
