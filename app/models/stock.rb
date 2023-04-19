class Stock < ApplicationRecord
    belongs_to :portfolio
    validates :symbol, presence: true
    validates :purchase_price, presence: true
    validates :quantity, presence: true
    validates :remaining, presence: true
end
