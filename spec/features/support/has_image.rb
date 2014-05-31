# credit: http://lostechies.com/derickbailey/2011/09/27/adding-a-has_image-matcher-to-capybara/

module Capybara
  class Session
    def has_image?(src, alt = nil)
      matched_src = has_xpath?("//img[contains(@src,\"/images/#{src}\")]")
      matched_alt = has_xpath?("//img[contains(@alt,\"#{alt}\")]") unless alt.nil?

      unless alt.nil?
        return true if matched_alt && matched_src
      else
        return matched_src
      end
    end
  end
end
