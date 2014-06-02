require 'spec_helper'

describe CoinCalculator::Coin do
  before do
    @coins = CoinCalculator::Coin.new
  end

  describe "valid inputs" do
    describe "pence (p)" do
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
        it "returns the correct number of uk coins for '85'" do
          pennies = "85"
          expected_coins = { "two_pound" => 0, "one_pound" => 0, "fifty_pence" => 1, "twenty_pence" => 1, "two_pence" => 7, "one_pence" => 1 }

          expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
        end
      end

      context 'pence symbol' do
        it "returns the correct number of uk coins for '197p'" do
          pennies = "197p"
          expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 1, "twenty_pence" => 2, "two_pence" => 3, "one_pence" => 1 }

          expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
        end

        context 'single digit' do
          it "returns the correct number of uk coins for '2p'" do
            pennies = "2p"
            expected_coins = { "two_pound" => 0, "one_pound" => 0, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 1, "one_pence" => 0 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end
        end
      end
    end

    describe "pounds (£)" do
      context 'pounds decimal' do
        it "returns the correct number of uk coins for '1.87'" do
          pennies = "1.87"
          expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 1, "twenty_pence" => 1, "two_pence" => 8, "one_pence" => 1 }

          expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
        end

        context "with buffered zeros (leading zeros)" do
          it "returns the correct number of uk coins for '001.41p'" do
            pennies = "001.41p"
            expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 0, "twenty_pence" => 2, "two_pence" => 0, "one_pence" => 1 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end
        end

        context "rounding three decimal places to two" do
          it "returns the correct number of uk coins for '4.235p'" do
            pennies = "4.235p"
            expected_coins = { "two_pound" => 2, "one_pound" => 0, "fifty_pence" => 0, "twenty_pence" => 1, "two_pence" => 2, "one_pence" => 0 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end
        end
      end

      context 'pound symbol' do
        it "returns correct number of uk coins for '£1.23'" do
          pennies = "£1.23"
          expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 0, "twenty_pence" => 1, "two_pence" => 1, "one_pence" => 1 }

          expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
        end

        context 'single digit' do
          it "returns correct number of uk coins for '£2'" do
            pennies = "£2"
            expected_coins = { "two_pound" => 1, "one_pound" => 0, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 0, "one_pence" => 0 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end
        end

        context 'double digit' do
          it "returns correct number of uk coins for '£10'" do
            pennies = "£10"
            expected_coins = { "two_pound" => 5, "one_pound" => 0, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 0, "one_pence" => 0 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end
        end

        context 'pound and pence symbol' do
          it "returns correct number of uk coins for '£1.87p'" do
            pennies = "£1.87p"
            expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 1, "twenty_pence" => 1, "two_pence" => 8, "one_pence" => 1 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end

          context "rounding with symbols" do
            it "returns correct number of uk coins for '£1.257422457p'" do
              pennies = "£1.257422457p"
              expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 0, "twenty_pence" => 1, "two_pence" => 3, "one_pence" => 0 }

              expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
            end
          end
        end

        context 'missing pence' do
          it "returns correct number of uk coins for '£1p'" do
            pennies = "£1p"
            expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 0, "one_pence" => 0 }

            expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
          end

          context "present decimal point" do
            it "returns correct number of uk coins for '£1.p'" do
              pennies = "£1.p"
              expected_coins = { "two_pound" => 0, "one_pound" => 1, "fifty_pence" => 0, "twenty_pence" => 0, "two_pence" => 0, "one_pence" => 0 }

              expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
            end
          end
        end
      end
    end
  end

  describe "invalid inputs" do
    it "returns empty hash when 'empty string'" do
      pennies = ""
      expected_coins = { }

      expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
    end

    context "non-numeric character" do
      it "returns empty hash with input of '1x'" do
        pennies = "1x"
        expected_coins = { }

        expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
      end

      it "returns empty hash with input of '£1x.0p'" do
        pennies = "£1x.0p"
        expected_coins = { }

        expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
      end
    end

    it "returns empty hash when 'missing digits'" do
      pennies = "£p"
      expected_coins = { }

      expect(@coins.return_minimum_coins(pennies)).to eql(expected_coins)
    end
  end
end

