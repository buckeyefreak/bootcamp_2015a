module WorldExtension

  def navigate (from,to)
    path = []
    case from
      when 'USA home'
        case to
          when 'Savings Bond Calculator'

          path = ['Unclaimed Money, Taxes, and Credit Reports',
                  'Saving and Investing',
                  'Savings Bonds Online',
                  'Savings Bond Calculator', #icon
                  'Savings Bond Calculator']

          else fail("The path end page #{to} is not supported by this method")
        end
      else fail("The path start page #{from} is not supported by this method")
    end

    i = 0
    while i < 5
      if i < 3 or i == 4
        @current_page.navigate_by_link(path[i])
      elsif i == 3
        @current_page.navigate_by_div(path[i])
      end
      i = i+1
    end
  end
end

World(WorldExtension)