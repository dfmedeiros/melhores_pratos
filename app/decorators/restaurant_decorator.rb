class RestaurantDecorator < Draper::Decorator
  delegate_all

  def formatted_address
    "#{street}, #{short_formatted_address}"
  end

  def short_formatted_address
    "#{neighborhood}, #{city.name}, #{city.state.acronym}"
  end

  def formatted_website
    h.link_to website do
      "<i class=\"icon-globe\"></i>#{website}".html_safe
    end
  end

  def popover_info
    render_partial "restaurants/popover_info", restaurant: source
  end

  def popover_title
    render_partial "restaurants/popover_title", restaurant: source
  end

  private

  def render_partial(partial, options)
    ActionController::Base.new.send(:render_to_string, partial: partial, formats: :html, locals: options)
  end
end
