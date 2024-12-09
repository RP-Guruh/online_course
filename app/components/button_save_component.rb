# frozen_string_literal: true

class ButtonSaveComponent < ViewComponent::Base
  def initialize(redirect:)
    @redirect = redirect
  end
end
