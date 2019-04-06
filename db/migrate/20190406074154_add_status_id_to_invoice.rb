class AddStatusIdToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :status_id, :integer
  end
end
