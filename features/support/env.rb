require 'watir-webdriver'
require 'cucumber'
require 'rspec/expectations'
require 'titleize'
require 'page-object'

World(PageObject::PageFactory)

require_relative 'helper_methods.rb'
require_relative "../../pages/base_page_module.rb"
require_relative "../../pages/usa_home_page.rb"
require_relative "../../pages/savings_bond_page.rb"
