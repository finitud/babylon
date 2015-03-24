require 'pricers'

PromotionalRules = {
  :global => GlobalDiscountPricer.new(60.0, 0.90),
  "001" => MultipleUnitDiscountPricer.new(9.25, 2, 8.50),
  "002" => DefaultPricer.new(45.00),
  "003" => DefaultPricer.new(19.95)
}
