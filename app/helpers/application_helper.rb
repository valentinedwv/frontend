module ApplicationHelper
  def preserved_search_fields(options = {})
    preservable = [:q, :subject, :type, :start, :end, :page_size, :sort_by, :sort_order]
    to_preserve = preservable - Array(options[:without])
    ''.tap do |html|
      to_preserve.each do |field|
        if params[field].is_a? Array
          params[field].each { |value| html << hidden_field_tag("#{field}[]", value) if value.present? }
        elsif params[field].is_a? Hash
          params[field].each { |subfield,value| html << hidden_field_tag("#{field}[#{subfield}]", value) if value.present? }
        elsif params[field]
          html << hidden_field_tag(field, params[field])
        end
      end
    end.html_safe
  end
end
