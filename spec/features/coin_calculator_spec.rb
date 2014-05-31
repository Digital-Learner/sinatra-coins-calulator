require 'feature_helper'

describe CoinCalculator::Main, type: :feature do

  it 'shows the main page' do
    visit '/'
    expect(page).to have_content 'A simple Coin Calculator'
    expect(page).to have_title 'UK Coin Calculator'
    expect(page).to have_image('2013-Underground.jpeg', '2013 Underground 2 pound coin')
  end

  it "correctly calculates the minimum number of coins to issue for the specified number of 'pennies'" do
    @pennies = 4

    visit '/'
    fill_in :pennies, with: @pennies
    click_button 'Calculate'

    expect(page).to have_content("Here is the minimum number of coins for your request of #{@pennies} pence.")
    expect(page).to have_content("Denomination")
    expect(page).to have_content("Description")
    expect(page).to have_content("Quantity")
  end
end
