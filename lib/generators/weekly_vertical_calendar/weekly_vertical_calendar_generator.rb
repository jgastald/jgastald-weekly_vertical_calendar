class WeeklyVerticalCalendarGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  
    def initialize(args, runtime_options = {})
      super
      usage if args.length > 0 and args.length < 2
      @class_name = (args.shift || "event").underscore
      @view_name = (args.shift || "calendar").underscore
    end
  
  
  def manifest
    record do |m|
      m.template "index.html.erb", File.join("app/views", @view_name, "index.html.erb")
      m.template "_wcal.erb", File.join("app/views", @view_name, "_wcal.html.erb")
      m.template "weekly_vertical_calendar.scss", File.join("app/stylesheets", @view_name, "weekly_vertical_calendar.scss")
    end
  end
end
