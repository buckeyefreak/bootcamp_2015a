class CalculateSavingsBondPage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'http://www.treasurydirect.gov/BC/SBCPrice'
  end

  ########  define elements
  def calculator
    BROWSER.table(:class => 'entry')
  end
  def value
    BROWSER.text_field(:name => 'RedemptionDate')
  end
  def series
    BROWSER.select_list(:name => 'Series')
  end
  def update
    BROWSER.button(:name => 'btnUpdate.x')
  end
  def denomination
    BROWSER.select_list(:name => 'Denomination')
  end
  def bond
    BROWSER.text_field(:name => 'SerialNumber')
  end
  def issue
    BROWSER.text_field(:name => 'IssueDate')
  end
  def calculate
    BROWSER.button(:name => 'btnAdd.x')
  end
  def save
    BROWSER.link(:class => 'save')
  end
  def help
    BROWSER.image(:src => '/images/gw/icon_help.gif')
  end
end
