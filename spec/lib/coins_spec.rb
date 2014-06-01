require 'spec_helper'

describe CoinCalculator::Coin do
  before do
    @coins = CoinCalculator::Coin.new
  end

  context 'single digit' do
    it 'returns the correct number of 1 & 2 pence coins' do
      pennies = "4"
      coins = { '2_pence' => 2, '1_pence' => 0 }

      expect(@coins.return_minimum_coins(pennies)).to eql(coins)

      pennies = "9"
      coins = { '2_pence' => 4, '1_pence' => 1 }

      expect(@coins.return_minimum_coins(pennies)).to eql(coins)
    end
  end
end
