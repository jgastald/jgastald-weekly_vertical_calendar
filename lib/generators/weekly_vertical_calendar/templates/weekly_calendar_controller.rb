class WeeklyCalendarController < ApplicationController
  def index
    if params[:start_date] 
      @date = Time.parse("#{params[:start_date]}")  
    else
      @date = Time.now.utc
    end 
      @start_date = Date.new(@date.year, @date.month, @date.day)
      @end_date = @start_date + 7
      #      @events = Appointment.find(:all, :conditions => ['(start_at between ? and ?) or (end_at between ? and ?) or (start_at < ? and end_at > ?)',
#                                              @start_date, @end_date, @start_date, @end_date, @start_date, @end_date])
      # TODO: Filtrar citas
      @events = Appointment.all
#      puts "=====> " + @events.to_s()
  end
  
  

end
