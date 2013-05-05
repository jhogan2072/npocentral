module ApplicationHelper
  # This class is used in forms to display errors styled using twitter bootstrap styles
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  # The following helper method returns the appropriate twitter bootstrap CSS class
  # based on the flash class in Rails.  This helper function is then called in the
  # _messages partial which renders messages when there is something present in the
  # rails flash construct.  The initial space is because this will always follow a base
  # 'alert' css class.
  def flash_class(level)
    case level
      when :info then ' alert-info'
      when :notice then ' alert-success'
      when :error then ' alert-error'
      when :alert then ''
      else ''
    end
  end
end
