require 'rails/all'
require 'action_view/context'

module ActionView
  module Helpers
    def magic_form(*resources)
      form_content = ""
      form_eval = []
      out = ""
      form_content = ""
      options = resources.extract_options!
      resource = resources.last
      resource.attribute_names.each do |attribute|
        unless attribute == "created_at" || attribute == "updated_at"
          form_eval << "f.label '#{options[attribute.to_sym] || attribute.to_sym}'"
          form_eval << "f.text_field :#{attribute}"
        end
      end

      form_eval << "f.submit '#{options[:submit] || 'submit' }'"
      out = form_for resource do |f|
              form_eval.each do |c|
                form_content << "#{eval(c)}"
              end
              form_content
            end
      out
    end
  end
end