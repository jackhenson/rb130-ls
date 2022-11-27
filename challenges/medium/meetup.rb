
# Meetups

# Meetups are a great way to meet people who share a
# common interest. Typically, meetups happen monthly
# on the same day of the week. For example, a meetup's
# meeting may be set as:

#     The first Monday of January 2021
#     The third Tuesday of December 2020
#     The teenth wednesday of December 2020
#     The last Thursday of January 2021

# In this program, we'll construct objects that represent
# a meetup date. Each object takes a month number (1-12)
# and a year (e.g., 2021). Your object should be able to
# determine the exact date of the meeting in the specified
# month and year. For instance, if you ask for the 2nd
# Wednesday of May 2021, the object should be able to
# determine that the meetup for that month will occur
# on the 12th of May, 2021.

# The descriptors that may be given are strings: 'first',
# 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'.
# The case of the strings is not important; that is, 'first'
#   and 'fIrSt' are equivalent. Note that "teenth" is a made
#   up word. There was a meetup whose members realised that
#   there are exactly 7 days that end in '-teenth'. Therefore,
#   it's guaranteed that each day of the week (Monday, Tuesday, ...)
#   will have exactly one date that is the "teenth" of that day
#   in every month. That is, every month has exactly one "teenth"
#   Monday, one "teenth" Tuesday, etc. The fifth day of the month
#   may not happen every month, but some meetup groups like
#   that irregularity.

# The days of the week are given by the strings 'Monday', 'Tuesday',
# 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'.
# Again, the case of the strings is not important.

require 'date'

class Meetup
  DESCRIPTOR_INDEX = { "first" => 0,
                       "second" => 1,
                       "third" => 2,
                       "fourth" => 3,
                       "fifth" => 4,
                       "last" => -1
                      }

  NUM_OF_DAYS_IN_MONTH = { [1, 3, 5, 7, 8, 10, 12] => 31,
                           [4, 6, 9, 11] => 30,
                           [2] => 28,
                         }

  TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]

  attr_reader :year, :month
  
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    descriptor = descriptor.downcase

    result = case descriptor
             when "teenth"
               match_teenth_day(weekday)
             else
              days_of_given_weekday(weekday)[DESCRIPTOR_INDEX[descriptor]]
             end

    return nil if result.nil?
    Date.new(year, month, result)
  end

  private

  def days_of_given_weekday(weekday)
    days = []
    (1..days_in_month).each do |n|
      date = Date.new(year, month, n)
      days << n if date.send("#{weekday}?")
    end

    days
  end

  def days_in_month
    return 29 if month == 2 && Date.leap?(year)
    NUM_OF_DAYS_IN_MONTH.keys.each do |k|
      return NUM_OF_DAYS_IN_MONTH[k] if k.include? month
    end
  end

  def match_teenth_day(weekday)
    TEENTH_DAYS.select do |n|
      Date.new(year, month, n).send("#{weekday}?")
    end.first
  end
end

# Meetup.new(2013, 3).day('Monday', 'first')
# Meetup.new(2013, 4).day('monday', 'FIRST')
Meetup.new(2015, 10).day('Wednesday', 'fifth')