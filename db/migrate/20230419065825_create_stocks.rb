class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.float :purchase_price
      t.integer :quantity 
      t.integer :remaining 
      t.belongs_to :portfolio
      t.timestamps
    end
  end
end
