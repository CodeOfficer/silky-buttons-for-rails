module SilkyButtonsHelper

  def silk_image( img, options={} )
    image_tag "/images/silk/icons/#{img}", options
  end

  def submit_resource_button(text, options={})
    options[:text]      = text
    options[:type]      = "submit"
    options[:icon]      ||= "tick.png"
    unless options[:icon].blank?
      options[:icon] =  silk_image(options[:icon])
      options[:text] = "#{options[:icon]} #{options[:text]}"
    end
    options.merge!({ :class => "button #{options[:class]}" })
    content_tag :button, options[:text], options.delete_if { |k, v| [:icon, :text].include? k }
  end
  alias_method :submit_button, :submit_resource_button

  def show_resource_button(resource, options={})
    options[:icon]  ||= "eye.png"
    options[:text]  ||= "Show #{resource.class.to_s.humanize}"
    options[:path]  ||= polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :show_button, :show_resource_button

  def new_resource_button(resource, options={})
    options[:class]   = "positive #{options[:class]}"
    options[:icon]  ||= "add.png"
    options[:text]  ||= "New #{resource.class.to_s.humanize}"
    options[:path]  ||= new_polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :new_button, :new_resource_button

  def edit_resource_button(resource, options={})
    options[:icon]  ||= "pencil.png"
    options[:text]  ||= "Edit #{resource.class.to_s.humanize}"
    options[:path]  ||= edit_polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :edit_button, :edit_resource_button

  def destroy_resource_button(resource, options={})
    options[:class]   = "negative #{options[:class]}"
    options[:method]  ||= :delete
    options[:confirm] ||= "Are you sure?"
    options[:icon]    ||= "delete.png"
    options[:text]    ||= "Delete #{resource.class.to_s.humanize}"
    options[:path]    ||= polymorphic_path(resource)
    resource_button(resource, options)
  end
  alias_method :destroy_button, :destroy_resource_button

  def resource_button(resource, options={})
    options[:text]        ||= resource.class.to_s.humanize
    options[:path]        ||= polymorphic_path(resource)
    unless options[:icon].blank?
      options[:icon] = silk_image(options[:icon])
      options[:text] = "#{options[:icon]} #{options[:text]}"
    end
    options.merge!({ :class => "button #{options[:class]}" })
    link_to options[:text], options[:path], options.delete_if { |k, v| [:icon, :text, :path].include? k }
  end
  
end
