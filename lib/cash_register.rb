require 'pry'
class CashRegister
    attr_accessor :total, :discount, :title, :price, :quantity
    

    def initialize(discount = 0, total = 0)
        @total = total
        @discount = discount
        @items = []
        @transactions = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)   
        
        self.total += (price * quantity)
        quantity.times do @items << title end
        @transactions << price
    end

    def apply_discount
        if discount != 0
            discount = @discount.to_f / 100
            self.total -= (self.total.to_f * discount)
        
            return "After the discount, the total comes to $#{total.to_i}."
        else
            return "There is no discount to apply."
        end
        
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @transactions.pop
        if @transactions.length == 0
            self.total = 0.0
        end
    end
end

