def transformation (chosen_browser)
  case chosen_browser.downcase
    when 'internet explorer', 'ie', 'internet_explorer'
      :internet_explorer
    when 'ff', 'firefox'
      :firefox
    when 'google chrome', 'google_chrome', 'chrome'
      :chrome
    when 'phantom', 'phantomjs'
      :phantomjs
    else
      fail "#{chosen_browser} is not a supported browser."
  end
end
