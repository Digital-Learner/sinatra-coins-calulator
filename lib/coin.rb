module CoinCalculator
  class Coin
    attr_reader :input
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
      pence = pence.to_i

      two_pence = pence / 2
      one_pence = pence % 2

      if (two_pence * 2) + (one_pence * 1) == pence
        coins = { '2_pence' => two_pence, '1_pence' => one_pence }
      end
    end
  end
end
