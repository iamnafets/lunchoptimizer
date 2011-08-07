module HistoryHelper
  def show_history_calendar(events = nil,year = DateTime.now.year,month = DateTime.now.month)
    month_names = (!defined?(I18n) || I18n.t("date.month_names").include?("missing")) ? Date::MONTHNAMES.dup : I18n.t("date.month_names")
    calendar(
      :year => year,
      :month => month,
      :calendar_title => "<a href=\"#\" class=\"next\"></a>#{month_names[month]} #{year.to_s}",
      :month_header => false
    ) do |d|
      rval = render :partial => 'history/day', :locals => {
        :date => d, 
        :events => (if events.nil? then [] else events.find_all{ |event| event[:date] == d} end)
      }
    end
  end
end
