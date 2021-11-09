# frozen_string_literal: true

module NavigationHelper
  def navigation_link_to(name, path, **options)
    classes = options.fetch(:class, [])
    active_class = current_page?(path) ? 'is-dark' : ''
    classes = Array(classes) << active_class << 'button is-white'

    link_to name, path, options.merge(class: classes)
  end
end
