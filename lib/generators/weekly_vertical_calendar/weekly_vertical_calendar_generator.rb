class WeeklyVerticalCalendarGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  
  #    def initialize(args, runtime_options = {})
#      super
#      usage if args.length > 0 and args.length < 2
#      @class_name = (args.shift || "event").underscore
#      @view_name = (args.shift || "calendar").underscore
      
      #    end
  
  
  def manifest
    @view_name = "weekly_calendar"
    @model_name = name
    template "index.html.erb", File.join("app/views", @view_name, "index.html.erb")
    template "_wcal.html.erb", File.join("app/views", @view_name, "_wcal.html.erb")
    template "weekly_calendar_controller.rb.erb", File.join("app/controllers", "weekly_calendar_controller.rb")      
    template "weekly_calendar_helper.rb", File.join("app/helpers", "weekly_calendar_helper.rb")
    
    route "match '/weekly_calendar' => 'weekly_calendar#index'"
  end
end
