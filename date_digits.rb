# frozen_string_literal: true

class DateDigits
  def initialize(year, month, day, array)
    @year = year
    @month = month
    @day = day
    @array = array
  end

  def generate_first_six
    valid_year
    valid_month
    valid_day
  end

  private

  def valid_year
    year_digits if (1900..2099).cover?(@year)
  end

  def year_digits
    @array[0..1] = @year.to_s[2..3].split(//)
  end

  def valid_month
    month_digits if (1..12).cover?(@month)
  end

  def month_digits
    if @month < 10 && @year <= 2000 then month_digits_first_case
    elsif (1..12).cover?(@month) && @year >= 2000 then month_digits_secound_case
    else
      month_digits_third_case
    end
  end

  def month_digits_first_case
    @month_str = @month.to_s.insert(0, '0')
    @array[2..3] = @month_str.split(//)
  end

  def month_digits_secound_case
    @month_str = (@month + 40).to_s
    @array[2..3] = @month_str.split(//)
  end

  def month_digits_third_case
    @month_str = @month.to_s
    @array[2..3] = @month_str.split(//)
  end

  def valid_day
    if @month.odd? && (0..31).cover?(@day)
      day_digits
    elsif @month == 2 && (@year % 4).zero? && (0..29).cover?(@day)
      day_digits
    elsif @month == 2 && (@year % 4) != 0 && (0..28).cover?(@day)
      day_digits
    elsif (@month % 2).zero? && @month != 2 && (0..30).cover?(@day)
      day_digits
    end
  end

  def day_digits
    @day_str = if @day < 10
                 @day.to_s.insert(0, '0')
               else
                 @day.to_s
               end
    @array[4..5] = @day_str.split(//)
  end
end