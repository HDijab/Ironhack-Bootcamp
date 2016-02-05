module ApplicationHelper
  def this_months_concerts
    from = Date.tomorrow
    to = from.end_of_month
    @this_months_concerts = Concert.where(date: from..to).order("date ASC")
    @this_months_concerts
  end
end
