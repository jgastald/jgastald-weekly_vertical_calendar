module WeeklyCalendarHelper
  
  @@hora_inicial  = 8
  @@hora_final    = 23
  
  #  def weekly_vertical_calendar(objects, *args)
  def weekly_vertical_calendar(objects, *args)  
    options = args.last.is_a?(Hash) ? args.pop : {}
    start_date, end_date = date(options[:date] || Time.now)
    r = "<div id='week'>".html_safe
#    r +=  yield Builder.new(objects || [], self, start_date, end_date)
    r += render :partial => "wcal"
    r += "</div>".html_safe
    return r
  end

  def weekly_vertical_calendar_links(options)
    start_date, end_date = date(options[:date] || Time.now)
    return "<a href='?start_date=#{start_date - 7}?user_id='> .. Semana anterior</a> ".html_safe +
      "#{start_date.strftime("%B %d -")} #{end_date.strftime("%B %d")} #{start_date.year}".html_safe +
      " <a href='?start_date=#{start_date + 7}?user_id='>Proxima Semana ..</a>".html_safe
  end

  def date(date)
    start_date = Date.new(date.year, date.month, date.day)
    end_date = Date.new(date.year, date.month, date.day) + 6
    [start_date, end_date]
  end

  def get_event_name(event)    
#    puts " -----> state: " + state
#    return "new_event"
    name = case event.state
      when :new.to_s() 
        "new_event"
      when :finished.to_s()
        "finished_event"
      when :cancelled.to_s()
        "cancelled_event"
      else
        ""
    end
    if event.duration == 0
      name += " brief_event"
    end
    return name
  end

  # ----- FUNCIONES ---- 
  def wcal_top(start_at, end_at, day)
    hours, minutes = wcal_hours_and_minutes(start_at)
    j_start_at, j_end_at, j_day = wcal_j(start_at, end_at, day)
    return -1 if (j_start_at != j_end_at and j_start_at != j_day)
    ( (hours - @@hora_inicial) * 40 * 2) + minutes * 4/3
  end

  def wcal_height(start_at, end_at, day)
    top = wcal_top(start_at, end_at, day)
    hours, minutes = wcal_hours_and_minutes(end_at)
    j_start_at, j_end_at, j_day = wcal_j(start_at, end_at, day)
    return (960 * 2 - top) if (j_start_at != j_end_at and j_end_at != j_day)
    ( (hours - @@hora_inicial) * 40 * 2) + minutes * 4/3 - top
  end

  def wcal_hours_and_minutes(date)
    [(date.strftime('%H').to_f), (date.strftime('%M').to_f)]
  end

  # Retorna el dia del año
  def wcal_j(start_at, end_at, day)
    [start_at.strftime('%j'), end_at.strftime('%j'), day.strftime('%j')]
  end


end


