class RestaurantDecorator < Draper::Decorator
  delegate_all

  def formatted_address
    "#{street}, #{neighborhood}, #{city.name}, #{state.acronym}"
  end

  def formatted_website
    h.link_to website do
      "<i class=\"icon-globe\"></i>#{website}".html_safe
    end
  end
end
