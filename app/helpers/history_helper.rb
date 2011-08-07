module HistoryHelper
  def show_history_calendar(events = nil)
    calendar(:year => 2011, :month => 6) do |d|
      rval = render :partial => 'history/day', :locals => {
        :date => d, 
        :events => (if events.nil? then [] else events.find_all{ |event| event[:date] == d} end)
      }
    end
  end
end
