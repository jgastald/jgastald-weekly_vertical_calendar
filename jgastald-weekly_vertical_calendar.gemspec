$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jgastald-weekly_vertical_calendar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jgastald-weekly_vertical_calendar"
  s.version     = JgastaldWeeklyVerticalCalendar::VERSION
  s.authors     = ["jgastald"]
  s.email       = ["jgastald@gmail.com"]
#  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of JgastaldWeeklyVerticalCalendar."
  s.description = "TODO: Description of JgastaldWeeklyVerticalCalendar."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
end
