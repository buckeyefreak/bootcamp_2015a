module WorldExtension

  def navigate (from,to)
    path_links = []
    case from
      when 'USA home'
        case to
          when 'Savings Bond Calculator'
            path_links = ['Unclaimed Money, Taxes, and Credit Reports',
                          'Saving and Investing',
                          'Savings Bonds Online',
                          'Tools',
                          'Savings Bonds Calculator']
          else fail("The path end page #{to} is not supported by this method")
        end
      else fail("The path start page #{from} is not supported by this method")
    end

    path_links.each {|link_name| @current_page.navigate_by_link(link_name) }
  end
end

World(WorldExtension)