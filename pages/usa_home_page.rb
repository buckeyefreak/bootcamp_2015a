class UsaHomePage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'www.usa.gov'
  end

  #define elements
  def search
    BROWSER.text_field(:id => "query")
  end

  def submit
    BROWSER.button(:id => "buscarSubmit")
  end

  def results
    BROWSER.divs(:id => /^result-/)
  end

  def results_message
    BROWSER.div(:id => 'no-results')
  end

  #define methods

  def submit_search(query)
    search.set query
    submit .click
  end

  def search_value
    if search.placeholder == ''
      search.value
    else
      search.placeholder
    end
  end

  def search_term_length
    search_value.size
  end

  def submit_label
    submit.text
  end

  def results_count
    results.size
  end

  def search_message
    results_message.text
  end

end