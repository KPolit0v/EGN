# frozen_string_literal: true

class CityGenderDigits
  def initialize(city, gender, array)
    @city = city
    @gender = gender
    @array_egn = array
  end

  def main_method
    city_check
    gender_check
    valid_egn?
  end

  private

  def city_check
    @city_digits = CityDigits.new(@array_egn, @city)
    @city_digits.city_selector
  end

  def gender_check
    if @gender == 'm' || @gender == 'f'
      gender_calculations
    else
      puts 'invalid gender'
    end
  end

  def gender_calculations
    @array_gender = File.open('gender_check.txt', 'w+')
    File.open('potential_egn.txt', 'r') do |file|
      file.readlines.each do |line|
        @element = line
        gender_check_body
      end
    end
    @array_gender.close
  end

  def gender_check_body
    if @gender == 'm' && (@element[8].to_i % 2).zero?
      @array_gender.write @element
    elsif @gender == 'f' && @element[8].to_i.odd?
      @array_gender.write @element
    end
  end

  def valid_egn?
    @egn_valid = File.open('valid_egn.txt', 'w+')
    File.open('gender_check.txt', 'r') do |file|
      file.readlines.each do |line|
        @element = line
        body_valid_egn?
      end
    end
    @egn_valid.close
  end

  def body_valid_egn?
    counter = 0
    elements_sum = 0
    array = [2, 4, 8, 5, 10, 9, 7, 3, 6]
    array.each do
      elements_sum += @element[counter].to_i * array[counter].to_i
      counter += 1
    end
    @egn_valid.write @element if elements_sum % 11 == @element[9].to_i
  end
end