module WorldExtension

  def navigate (from,to)
    path = []
    case from
      when 'USA home'
        case to
          when 'Savings Bond'

          path = ['Unclaimed Money, Taxes, and Credit Reports',
                  'Saving and Investing',
                  'Savings Bonds Online',
                  'Savings Bond Calculator']

          else fail("The path end page #{to} is not supported by this method")
        end
      else fail("The path start page #{from} is not supported by this method")
    end


        path.each {|link| @current_page.navigate_by_link(link)}

  end
end

World(WorldExtension)