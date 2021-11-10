# frozen_string_literal: true

module FormHelper
  def render_errors(record)
    return if record.errors.empty?

    render 'shared/form/errors', errors: record.errors
  end
end
