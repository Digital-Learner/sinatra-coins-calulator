# credit: http://lostechies.com/derickbailey/2011/09/27/adding-a-has_image-matcher-to-capybara/

module Capybara
  class Session
    def has_image?(src)
      has_xpath?("//img[contains(@src,\"/images/#{src}\")]")
    end
  end
end
