module Babylon

  class Checkout

    attr_accessor :promotional_rules, :items_in_cart

    def initialize(promotional_rules)
      self.promotional_rules = promotional_rules
      self.items_in_cart ||= {}
    end

    def scan(item_id)
      self.items_in_cart[item_id] = self.items_in_cart.fetch(item_id, 0) + 1
    end

    def total
      subtotal = self.items_in_cart.inject(0.0) do |subtotal, item|
        subtotal += self.promotional_rules[item[0]].method(:total).call(item[1])
      end
      subtotal = promotional_rules[:global].method(:total).call(subtotal)
      sprintf('%.2f', subtotal)
    end

  end

end