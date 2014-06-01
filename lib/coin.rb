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
      if data =~ /\d/
        calculate_minimum_coins(data)
      else
        return {}
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
