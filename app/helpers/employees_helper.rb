module EmployeesHelper
  def get_fridays(date)
    date.to_date.next_occurring(:friday)
  end

  def weeks_tag
    fridays = [Date.today.next_occurring(:friday)]
    #
    # # Generate the lunch dates for next 6 weeks
    #
    5.times do |i|
      fridays.push(get_fridays(fridays.last))
    end
    select_tag "week", options_for_select(fridays)
  end

end
