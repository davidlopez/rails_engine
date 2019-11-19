require 'csv'

namespace :add_data do
  desc "Data entries from CSV data"
  task csv_to_db: :environment do
    file_datatypes = {
      "data/customers.csv" => Customer, 
      "data/merchants.csv" => Merchant, 
      "data/items.csv" => Item, 
      "data/invoices.csv" => Invoice, 
      "data/invoice_items.csv" => InvoiceItem, 
      "data/transactions.csv" => Transaction 
    }
    
    file_datatypes.each do |file, datatype|
      CSV.foreach(file, headers: true) do |row|
        datatype.create!(row.to_hash)
      end
    end
  end
end