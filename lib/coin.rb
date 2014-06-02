module CoinCalculator
  class Coin
    attr_reader :input

    DENOMINATIONS_IN_PENCE = { two_pound: 200, one_pound: 100, fifty_pence: 50, twenty_pence: 20, two_pence: 2, one_pence: 1 }

    def initialize
      @uk_coins = {}
    end

    def return_minimum_coins(requested_amount)
      validate_input(requested_amount)
    end

    def validate_input(data)
      matched = data.match(/(^[£]?)(\d+[.]?\d*)([p]?$)/)
      unless matched.nil?
        canonical_pence = to_pence(matched.captures)
        calculate_minimum_coins(canonical_pence)
      else
        return {}
      end
    end

    def to_pence(input)
      pound_group, amount, pence_group = input[0], input[1], input[2]
      if amount.include?('.')
        (amount.to_f.round(2) * 100).to_i
      else
        pound_group.include?('£') ? amount.to_i * 100 : amount
      end
    end

    def calculate_minimum_coins(pence)
      total_pence = pence.to_i
      remaining_pence = total_pence

      DENOMINATIONS_IN_PENCE.keys.each do |k|
        remaining_pence = coin(k, remaining_pence)
      end
      return @uk_coins
    end

    def coin(denomination, amount)
      if DENOMINATIONS_IN_PENCE.keys.include?(denomination.to_sym)
        @uk_coins["#{denomination}"] = amount / DENOMINATIONS_IN_PENCE[denomination.to_sym]
        return amount % DENOMINATIONS_IN_PENCE[denomination.to_sym]
      end
    end
  end
end
