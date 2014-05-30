require 'feature_helper'

describe CoinCalculator::Main, type: :feature do

  it 'shows the main page' do
    visit '/'
    expect(page).to have_content 'A simple Coin Calculator'
    expect(page).to have_title 'UK Coin Calculator'
  end
end
