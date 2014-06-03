require 'feature_helper'

describe CoinCalculator::Main, type: :feature do

  it 'shows the main page' do
    visit '/'
    expect(page).to have_content 'A simple Coin Calculator'
    expect(page).to have_title 'UK Coin Calculator'
    expect(page).to have_image('2013-Underground.jpeg', '2013 Underground 2 pound coin')
  end

  it "correctly calculates the minimum number of coins to issue for the 'requested amount'" do
    @requested_amount = 4

    visit '/'
    fill_in :amount, with: @requested_amount
    click_button 'Calculate'

    expect(page).to have_content("Here is the minimum number of coins for your request of #{@requested_amount} pence.")
    expect(page).to have_content("Denomination")
    expect(page).to have_content("Description")
    expect(page).to have_content("Quantity")

    expect(page).to have_image('2-pence-coin')
    expect(page).to have_content('2 pence')
    expect(page).to have_content(2)
  end

  it "returns a warning when no amount entered" do
    visit '/'
    fill_in :amount, with: ''
    click_button 'Calculate'

    expect(page).to have_content 'A simple Coin Calculator'
  end
end
