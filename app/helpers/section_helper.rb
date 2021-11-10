# frozen_string_literal: true

module SectionHelper
  def section_title(title, **_options)
    tag.h1(title, class: 'title is-4 is-uppercase')
  end
end
