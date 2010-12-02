require 'action_view/context'

module ActionView
  module Helpers
    module MagicFormHelper

      extend ActiveSupport::Concern
      include FormHelper

      def magic_form(*resources)
        options = resources.extract_options!
        resource = resources.last
        attributes = resource.attribute_names - ["created_at", "updated_at"]

        form_for(resources) do |f|
          attributes.each do |attribute|
            concat(f.label attribute, options[attribute.to_sym])
            concat(f.text_field attribute)
          end
          concat(f.submit)
        end
      end
    end
  end

  ActionView::Helpers.autoload :MagicFormHelper
  ActionView::Helpers.send(:include, Helpers::MagicFormHelper)

end


