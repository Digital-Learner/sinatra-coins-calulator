require 'spec_helper'

describe CoinCalculator::Coin do
  before do
    @coins = CoinCalculator::Coin.new
  end

  context 'single digit' do
    it "returns the correct number of 1 & 2 pence coins for '4'" do
      pennies = "4"
      expected_coins = { "two_pound" => 0, "one_pound" => 0, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 2, "one_pence" => 0 }

      expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
    end

    it "returns the correct number of 1 & 2 pence coins for '9'" do
      pennies = "9"
      expected_coins = { "two_pound" => 0, "one_pound" => 0, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 4, "one_pence" => 1 }

      expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
    end
  end

  context 'double digit' do
    it "returns the correct number of 1, 2, 20 & 50 pence coins for '85'" do
      pennies = "85"
      expected_coins = { "two_pound" => 0, "one_pound" => 0, "fifty_pence" => 1, "twenty_pence" => 1, "two_pence" => 7, "one_pence" => 1 }

      expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
    end
  end

  context 'pence symbol' do
    it "returns the correct number of 1, 2, 20 & 50 pence coins for '197p'" do
      pennies = "197p"
      expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 1, "twenty_pence" => 2, "two_pence" => 3, "one_pence" => 1 }

      expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
    end
  end
end
