class UsaHomePage
  include BasePageModule

  attr_accessor :url

  def initialize
    @url = 'www.usa.gov'
  end

  ########  define elements
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

  def contents
    BROWSER.div(:class => 'hpboxcontainer')
  end

  def sections
    BROWSER.divs(:class => /container/)
  end

  def contents_links
    contents.links
  end

  def feature_section
    BROWSER.div(:id => 'featureInfo')
  end

  ########  define methods

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

  def contents_title
    contents.h2.text
  end

  def contents_link_names
    link_names = []
    contents_links.each do |item|
      link_text = item.text.downcase
      link_text.gsub!(' from usa.gov','').strip if link_text =~ /e-mail/
      link_names << link_text
    end

    link_names
  end

  def section_titles
    titles = []
    sections.each {|section| titles.push(section.h3.text.downcase) if section.h3.exist?}
    titles.push(feature_section.h2.text.downcase) if feature_section.exist?

    titles
  end

end