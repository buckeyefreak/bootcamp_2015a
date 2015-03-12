module BasePageModule

#This module contains methods that can be used from any page

  def visit
    BROWSER.goto url
  end

  def navigate_by_link(link_name)
    BROWSER.wait(timeout=30)
    if BROWSER.link(:text =>/^#{link_name}/).exist?
      BROWSER.link(:text => /^#{link_name}/).click
    else
      BROWSER.link(:title => link_name).when_present.click
    end
  end



  def browser_title
    BROWSER.title
  end

  def window_count
    BROWSER.windows.count
  end

  def use_last_window
    BROWSER.windows.last.use
  end

end