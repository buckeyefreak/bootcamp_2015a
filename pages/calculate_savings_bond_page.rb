class CalculateSavingsBondPage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'http://www.treasurydirect.gov/BC/SBCPrice'
  end


  ######## default creation
  def default_method (default)
    case default
      when 'current month/current year'
        @month = Time.now.strftime("%m").to_i
        @year = Time.now.strftime("%Y").to_i
        default_date = (BROWSER.text_field(:name => 'RedemptionDate').value).split('/').map{|x| x.to_i}
        if default_date[0] == @month
          if default_date[1] == @year
            true
          else
            false
          end
        else
          false
        end
      when 'EE bonds', '$50'
        default_series = BROWSER.select_list(:name => 'Series').value
        default_denom = BROWSER.select_list(:name => 'Denomination').value
        if default_series == 'EE'
          true
        elsif default_denom == '50'
          true
        else
          false
        end
      else
        fail("This scenario is not allowed.")
    end
  end

  def list_method (list_options)
    actual_list = []
    expected_list = []
    case list_options
      when 'EE Bonds. I Bonds. E Bonds. Savings Notes'
        actual_list = BROWSER.select_list(:name => 'Series')
      when '$10. $25. $50. $75. $100. $200. $500. $1,000. $5,000. $10,000'
        actual_list = BROWSER.select_list(:name => 'Denomination')
    end
    expected_list = list_options.gsub(' ','').gsub('$','').split('.').map{|x| x}

    actual_list = actual_list.options.map(&:text)
    actual_list.each do |remove|
      remove.gsub!('$','')
      remove.gsub!(' ','')
    end
    expected_list.sort!
    actual_list.sort!
    if expected_list == actual_list
      true
    else
      true
    end
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
  def error
    BROWSER.div(:class => 'errormessage')
  end

  #########  actions

  def select_bond (bond_type)
    BROWSER.select_list(:name => 'Series').select(bond_type)
  end

  def bond_denom (amount)
    BROWSER.select_list(:name => 'Denomination').select(amount)
  end
  def enter_date(entered_date)
    BROWSER.text_field(:name => 'IssueDate').set(entered_date)
  end
  def calculate_now(name, type)
    BROWSER.button(:name => 'btnAdd.x').click
  end
end