module Decimalable
    def change_to_decimal
        self.unit_price = (self.unit_price / 100).to_f
    end
end
