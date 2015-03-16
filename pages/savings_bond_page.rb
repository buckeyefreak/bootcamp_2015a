class SavingsBondPage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'http://www.treasurydirect.gov/BC/SBCPrice'
  end
  ########  define elements

  def savings_bond_calculator
    BROWSER.table(:class => 'entry')
  end

  def value_as_of
    BROWSER.text_field(:name => 'RedemptionDate')
  end

  def series_list
    BROWSER.select_list(:name => 'Series')
  end

  def update_button
    BROWSER.button(:name => 'btnUpdate.x')
  end

  def denomination_list
    BROWSER.select_list(:name => 'Denomination')
  end

  def bond_serial_number
    BROWSER.text_field(:name => 'SerialNumber')
  end

  def issue_date
    BROWSER.text_field(:name => 'IssueDate')
  end

  def calculate_button
    BROWSER.button(:name => 'btnAdd.x')
  end

  def how_to_save_your_inventory
    BROWSER.link(:class => 'save')
  end

  def help_image
    BROWSER.image(:src => '/images/gw/icon_help.gif')
  end

  def results_section
    BROWSER.table(:class => 'bnddata')
  end

  #########  actions

  def select_bond (bond_type)
    BROWSER.select_list(:name => 'Series').select_value(bond_type)
  end

  def select_amount (amount)
    BROWSER.select_list(:name => 'Denomination').select_value(amount)
  end

  def enter_date(date)
    BROWSER.text_field(:name => 'IssueDate').set(date)
  end

  def click_button(name)
    BROWSER.button(:value => name).click
  end


  ######## default creation
  def default_date
    (BROWSER.text_field(:name => 'RedemptionDate').value).split('/').map{|x| x.to_i}
  end

  def default_bond
    BROWSER.select_list(:name => 'Series').value
  end

  def default_amount
    BROWSER.select_list(:name => 'Denomination').value
  end

  def denomination_options
    BROWSER.select_list(:name => 'Denomination').options.map{|x| x.value}
  end

  def bond_options
    BROWSER.select_list(:name => 'Series').options.map{|x| x.value}
  end

end