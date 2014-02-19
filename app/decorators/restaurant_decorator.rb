class RestaurantDecorator < Draper::Decorator
  delegate_all

  def formatted_address
    "#{street}, #{neighborhood}, #{city.name}, #{state.acronym}"
  end
end
