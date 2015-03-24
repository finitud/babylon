class DefaultPricer

  attr_accessor :price

  def initialize(price)
    self.price = price
  end

  def total(number_of_items)
    self.price * number_of_items
  end

end


class MultipleUnitDiscountPricer < DefaultPricer

  def initialize(individual_price, multiple_units, multiple_units_price)
    self.price = {
      individual_price: individual_price,
      multiple_units: multiple_units,
      multiple_units_price: multiple_units_price
    }
  end

  def total(number_of_items)
    case number_of_items
    when 1..self.price[:multiple_units] - 1
      self.price[:individual_price] * number_of_items
    else
      self.price[:multiple_units_price] * number_of_items
    end
  end

end


class GlobalDiscountPricer

  attr_accessor :minimum_spend, :multiplier

  def initialize(minimum_spend, multiplier)
    self.minimum_spend = minimum_spend
    self.multiplier = multiplier
  end

  def total(subtotal)
    return subtotal if subtotal < self.minimum_spend
    subtotal * self.multiplier
  end

end
