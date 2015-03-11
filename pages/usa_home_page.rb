class UsaHomePage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'www.usa.gov'
  end

end