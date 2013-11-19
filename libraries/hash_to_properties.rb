def hash_to_properties(hash, lines = [], indent = 0)
  hash.each do |name, value|
    indent_string = @new_resource.template_sub_indent * indent
    if value.is_a? Hash
      lines << "#{indent_string}#{@new_resource.template_pre_key}#{name}#{@new_resource.template_post_key}#{@new_resource.template_separator_before_sub}"
      lines = hash_to_properties(value, lines, indent + 1)
    else
      lines << "#{indent_string}#{@new_resource.template_pre_key}#{name}#{@new_resource.template_post_key}#{@new_resource.template_separator}#{@new_resource.template_pre_value}#{value}#{@new_resource.template_post_value}"
    end
  end
  return lines
end
