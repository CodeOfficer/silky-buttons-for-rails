class SilkyButtonsGenerator < Rails::Generator::Base
  
  def initialize(runtime_args, runtime_options = {})
    super
  end
  
  def manifest
    record do |m|
      # helpers
        m.directory 'app/helpers'
        m.file "helpers/silky_buttons_helper.rb", "app/helpers/silky_buttons_helper.rb" 
      # stylesheets
        m.directory('public/stylesheets')
        m.file('stylesheets/silky_buttons.css', 'public/stylesheets/silky_buttons.css')
      # images
        m.directory('public/images/silk/icons')
        m.file('images/silk/readme.html', 'public/images/silk/readme.html')
        m.file('images/silk/readme.txt', 'public/images/silk/readme.txt')
        dir = File.join( File.dirname(__FILE__), "templates", "images", "silk", "icons" )
        Dir.new(dir).entries.each do |name|
          m.file("images/silk/icons/#{name}", "public/images/silk/icons/#{name}") if name.length > 2
        end
      # readme
        m.readme "INSTALL"
    end
  end
  
end