# frozen_string_literal: true

require_relative 'city_gender_digits.rb'
require_relative 'date_digits.rb'
require_relative 'city_digits.rb'
require_relative 'city_digits_calculations.rb'
require_relative 'delegate_hash.rb'

p 'Enter year:'
enter_year = gets.chomp.to_i
p 'Enter month:'
enter_month = gets.chomp.to_i
p 'Enter day:'
enter_day = gets.chomp.to_i
p 'Enter city:'
enter_city = gets.chomp
p 'Enter gender'
enter_gender = gets.chomp
egn_array = []

date_digits = DateDigits.new(enter_year, enter_month, enter_day, egn_array)
date_digits.generate_first_six

city_gender_digits = CityGenderDigits.new(enter_city, enter_gender, egn_array)
city_gender_digits.main_method