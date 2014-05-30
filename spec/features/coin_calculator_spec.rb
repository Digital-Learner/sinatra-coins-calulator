require 'feature_helper'

describe CoinCalculator::Main, type: :feature do
  # let(:application) { CoinCalculator::Main.new }

  it 'shows the main page' do
    visit '/'
    expect(page). to have_content 'A simple Coin Calculator'
  end
end
