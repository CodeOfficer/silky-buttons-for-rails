module SilkyButtonsHelper

  def silk_image( img, options={} )
    image_tag "/images/silk/icons/#{img}", options
  end

  def submit_resource_button(text, options={})
    options[:text]      = text
    options[:class]     ||= ''
    options[:id]        ||= ''
    options[:type]      ||= "submit"
    options[:icon]      ||= 'tick.png'
    unless options[:icon].blank?
      options[:icon] =  silk_image(options[:icon])
      options[:text] = "#{options[:icon]} #{options[:text]}"
    end
    link_to_options = {}
    link_to_options.merge!({ :class => "button clearfix #{options[:class]}" })
    link_to_options.merge!({ :id => options[:id] }) unless options[:id].blank?
    link_to_options.merge!({ :type => options[:type] })
    content_tag(:button, options[:text], link_to_options)
  end

  def new_resource_button(resource, options={})
    options[:icon]  ||= "add.png"
    options[:text]  ||= "Create a new #{resource.class.to_s.humanize}"
    options[:path]  ||= new_polymorphic_path(resource)
    resource_button(resource, options)
  end

  def edit_resource_button(resource, options={})
    options[:icon]  ||= "pencil.png"
    options[:path]  ||= edit_polymorphic_path(resource)
    options[:text]  ||= "Edit this #{resource.class.to_s.humanize}"
    resource_button(resource, options)
  end

  def destroy_resource_button(resource, options={})
    options[:icon]    ||= "delete.png"
    options[:path]    ||= polymorphic_path(resource)
    options[:text]    ||= "Delete this #{resource.class.to_s.humanize}"
    options[:method]  ||= :delete
    options[:confirm] ||= "Are you sure?"
    resource_button(resource, options)
  end

  def resource_button(resource, options={})
    options[:confirm]     ||= nil
    options[:method]      ||= nil
    options[:icon]        ||= ''
    options[:text]        ||= "Create a new #{resource.class.to_s.humanize}"
    options[:path]        ||= polymorphic_path(resource)
    options[:class]       ||= ''
    unless options[:icon].blank?
      options[:icon] = silk_image(options[:icon])
      options[:text] = "#{options[:icon]} #{options[:text]}"
    end
    link_to_options = {}
    link_to_options.merge!({ :class => "button #{options[:class]}" })
    link_to_options.merge!({ :method => options[:method] }) unless options[:method].blank?
    link_to_options.merge!({ :confirm => options[:confirm] }) unless options[:confirm].blank?
    content_tag :div, :class => "clearfix" do
      link_to options[:text], options[:path], link_to_options
    end
  end
  
end
