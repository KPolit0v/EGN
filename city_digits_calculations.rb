# frozen_string_literal: true

class CityDigitsCalc
  def initialize(array_first, range, counter)
    @array_first = array_first
    @range = range
    @counter = counter
    @arrayfile = File.open('potential_egn.txt', 'w+')
  end

  def blagoevgrad_body
    @range.each do
      if (0..9).cover?(@counter)
        array_under_10
      else
        array_under_100
      end
    end
    @arrayfile.close
  end

  def burgas_body
    @range.each do
      array_under_100
    end
    @arrayfile.close
  end

  def varna_body
    @range.each do
      if (93..99).cover?(@counter)
        array_under_100
      else
        array_up_100
      end
    end
    @arrayfile.close
  end

  def array_cycle
    @range.each do
      @array_str = (@array_first + @counter.to_s.split(//)).join
      @counter += 1
      last_digit_cycle
    end
    @arrayfile.close
  end

  def array_up_100
    @array_str = (@array_first + @counter.to_s.split(//)).join
    @counter += 1
    last_digit_cycle
  end

  def array_under_100
    @array_str = (@array_first + @counter.to_s.insert(0, '0').split(//)).join
    @counter += 1
    last_digit_cycle
  end

  def array_under_10
    @array_str = (@array_first + @counter.to_s.insert(0, '00').split(//)).join
    @counter += 1
    last_digit_cycle
  end

  def last_digit_cycle
    @counter_last = 0
    10.times do
      @array_string = @array_str + @counter_last.to_s
      @arrayfile.puts @array_string
      @counter_last += 1
    end
  end
end