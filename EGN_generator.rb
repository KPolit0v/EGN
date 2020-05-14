
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
		if valid_day == false || valid_year == false || valid_month == false
			false
		end
	end 

	private

	def valid_year
	  if (1900..2099).cover?(@year) 
	  	year_digits
	  else
	  	false
	  end
	 end

	def year_digits
		@array[0..1] = (@year.to_s[2..3]).split(//)
		
	end

	def valid_month
	  if (1..12).cover?(@month) 
	  	month_digits
	  
	  else
	  	false
	  end
	end

	def month_digits
		if @month < 10 && @year <= 2000
	  	@month_str = (@month.to_s).insert(0, '0')
	  	@array[2..3] = @month_str.split(//)
	  	elsif (1..12).cover?(@month) && @year >= 2000
	  	@month += 40
		@month_str = @month.to_s
	  	@array[2..3] = @month_str.split(//)
	  	else	
	    @month_str = (@month.to_s)
		@array[2..3] = @month_str.split(//)
	    end
	end
	

	def valid_day
	  if @month.odd? && (0..31).cover?(@day) 
      day_digits
      elsif  @month == 2 && (@year % 4).zero? && (0..29).cover?(@day)
      day_digits
      elsif  @month == 2 && (@year % 4) != 0 && (0..28).cover?(@day)
      day_digits
      elsif (@month % 2).zero? && @month != 2 && (0..30).cover?(@day)
      day_digits
      else
      puts false
      end
	end

	def day_digits
		if @day < 10
			@day_str = @day.to_s.insert(0, '0')
			@array[4..5] = @day_str.split(//)
		else
		@day_str = @day.to_s
		@array[4..5] = @day_str.split(//)
	    end
	
	end
end

class CityDigits
	def initialize (city, gender, array)
		@city = city
		@gender = gender
		@array_first = array
		@array = []
		@counter = 0
		@last_digit = 0
		@last_digit_range = 0..9
		@arrayfile = File.open("input_array.rb", "w+")
	end

	def gender_check
    array_gender = File.open("array.rb", "w+")
    File.open("input_array.rb", "r") do |file|  	
      	for line in file.readlines
      	          @element = line 
          		  if @gender == "m" && (@element[8].to_i % 2).zero?
                  array_gender.write @element
                   elsif @gender == "f" && @element[8].to_i.odd?
                  array_gender.write @element	
                   else
              	   false
                   end
        end           	
    end                   
    array_gender.close          
    end


	def city_digits

	  	case 
	  	  when @city == 'bl' then city_digits_blagoevgrad	
	  	  when @city == 'bu' then city_digits_burgas			
		  when @city == 'va' then city_digits_varna		
	  	  when @city == 've' then city_digits_veliko_tyrnovo		
	  	  when @city == 'vi' then city_digits_vidin		
	  	  when @city == 'vr' then city_digits_vraca		
	  	  when @city == 'ga' then city_digits_gabrovo 		
	  	  when @city == 'ky' then city_digits_kyrjali		
	  	  when @city == 'kq' then city_digits_kiustendil		
	  	  when @city == 'lo' then city_digits_lovech			
		  when @city == 'mo' then city_digits_montana		
	  	  when @city == 'pa' then city_digits_pazardjik		
	  	  when @city == 'pe' then city_digits_pernik	
	  	  when @city == 'ple' then city_digits_pleven		
	  	  when @city == 'plo' then city_digits_plovdiv		
	  	  when @city == 'ra' then city_digits_razgrad		
	  	  when @city == 'ru' then city_digits_ruse	
	  	  when @city == 'si' then city_digits_silistra		
		  when @city == 'sl' then city_digits_sliven	
	  	  when @city == 'sm' then city_digits_smolqn	
	  	  when @city == 'so_gr' then city_digits_sofia_grad 	
	  	  when @city == 'so_ob' then city_digits_sofia_okryg		
	  	  when @city == 'st' then city_digits_stara_zagora	
	  	  when @city == 'do' then city_digits_dobrich	
	  	  when @city == 'ty' then city_digits_tyrgovishte
	  	  when @city == 'ha' then city_digits_haskovo		
		  when @city == 'shu' then city_digits_shumen
	   	  when @city == 'qm' then city_digits_qmbol
	  	  when @city == 'dr' then city_digits_drug
	  	  else false
	  	end
  	end

	private

 	def array_cycle
 	  
 		@range.each do 
  	      @range_str = @counter.to_s  	      
  		  @array = @array_first + @range_str.split(//)   		  
  		  @counter += 1
  		  @array_str = @array.join
  		  @counter_last = 0
  		  10.times do

  		  	@array_string = @array_str + @counter_last.to_s 
  		  	@arrayfile.puts @array_string
  		  	@counter_last += 1
  		  end
  		end
  		@arrayfile.close
 	end

    def array_up_100
    	
    	 @range_str = @counter.to_s
  		 @array = @array_first + @range_str.split(//)
  		 @counter += 1
  		 @array_str = @array.join
  		 @counter_last = 0
  		  10.times do
  		  	@array_str += @counter_last.to_s
  		  	@arrayfile.write "\n#{@array_str}"
  		  	@counter_last += 1
  		  end
  		 @arrayfile.close
    end

 	def array_under_100

 	    @range_str = @counter.to_s.insert(0, '0')
  	    @array = @array_first + @range_str.split(//)
  	    @counter += 1
  	   @array_str = @array.join
  	    @counter_last = 0
  		  10.times do
  		  	@array_str += @counter_last.to_s
  		  	@arrayfile.write "\n#{@array_str}"
  		  	@counter_last += 1
  		  end                             #syswrite
  	    @arrayfile.close
  	end

    def array_under_10
    	
 	    @range_str = @counter.to_s.insert(0, '00')
  	    @array = @array_first + @range_str.split(//)
  	    @counter += 1
  	    @array_str = @array.join

  	    @counter_last = 0
  		  10.times do
  		  	@array_str += @counter_last.to_s
  		  	@arrayfile.write "\n#{@array_str}"
  		  	@counter_last += 1
  		  end
  	    @arrayfile.close
  	end

	def city_digits_blagoevgrad
      @range = 0...43
  	  @counter = 0
  	  @range.each do 
	    if (0..9).cover?(@counter)
  		  array_under_10
  		else
  		  array_under_100
  		end
  	  end
  	end

  	def city_digits_burgas
      @range = 43...93
  	  @counter = 44
  	  @range.each do 
  	    array_under_100
  	  end
  	end
    
    def city_digits_varna
      @range = 93...139
  	  @counter = 93
  	  @range.each do 
	    if (94..99).cover?(@counter)
  		  array_under_100
  		else
  		  array_up_100
  		end
  	  end
  	end

  	def city_digits_veliko_tyrnovo
      @range = 139...169
  	  @counter = 139
  	  array_cycle
  	end

  	def city_digits_vidin
      @range = 169...183
  	  @counter = 169
  	  array_cycle
  	end
	
	def city_digits_vraca
      @range = 183...217
  	  @counter = 183
  	  array_cycle
  	end

    def city_digits_gabrovo
      @range = 217...233
  	  @counter = 217
  	  array_cycle
  	end

    def city_digits_kyrjali
      @range = 233...281
  	  @counter = 233
  	  array_cycle
  	end

  	def city_digits_kiustendil
      @range = 281...301
  	  @counter = 281
  	  array_cycle
  	end

  	def city_digits_lovech
      @range = 301...319
  	  @counter = 301
  	  array_cycle
  	end

  	def city_digits_montana
      @range = 319...341
  	  @counter = 319
  	  array_cycle
  	end

  	def city_digits_pazardjik
      @range = 341...377
  	  @counter = 341
  	  array_cycle
  	end

  	def city_digits_pernik
      @range = 377...395
  	  @counter = 377
  	  array_cycle
  	end

  	def city_digits_pleven
      @range = 395...435
  	  @counter = 395
  	  array_cycle
  	end

  	def city_digits_plovdiv
      @range = 435...501
  	  @counter = 435
  	  array_cycle
  	end

  	def city_digits_razgrad
      @range = 501...527
  	  @counter = 501
  	  array_cycle
  	end

  	def city_digits_ruse
      @range = 527...555
  	  @counter = 527
  	  array_cycle
  	end

  	def city_digits_silistra
      @range = 555...575
  	  @counter = 555
  	  array_cycle
  	end

  	def city_digits_sliven
      @range = 575...601
  	  @counter = 575
  	  array_cycle
  	end

    def city_digits_smolqn
      @range = 601...623
  	  @counter = 601
  	  array_cycle
  	end

  	def city_digits_sofia_grad
      @range = 623...721
  	  @counter = 623
  	  array_cycle
  	end

  	def city_digits_sofia_okryg
      @range = 721...751
  	  @counter = 721
  	  array_cycle
  	end

  	def city_digits_stara_zagora
      @range = 751...789
  	  @counter = 751
  	  array_cycle
  	end

  	def city_digits_dobrich
      @range = 789...821
  	  @counter = 789
  	  array_cycle
  	end

  	def city_digits_tyrgovishte
      @range = 821...843
  	  @counter = 821
  	  array_cycle
  	end

  	def city_digits_haskovo
      @range = 843...871
  	  @counter = 843
  	  array_cycle
  	end

  	def city_digits_shumen
      @range = 871...903
  	  @counter = 871
  	  array_cycle
  	end

  	def city_digits_qmbol
      @range = 903...925
  	  @counter = 903
  	  array_cycle
  	end

	def city_digits_drug
      @range = 925...999
  	  @counter = 925
  	  array_cycle
  	end
end

x = DateDigits.new(enter_year, enter_month, enter_day, egn_array)
x.generate_first_six

y = CityDigits.new(enter_city, enter_gender, egn_array)
y.city_digits
y.gender_check



 egn_valid = File.open("valid_egn.rb", "w+")
    File.open("array.rb", "r") do |file|  	
      	for line in file.readlines
      	  element = line 
      	  counter = 0
      	  y = 0
      	  array = [2, 4, 8, 5, 10, 9, 7, 3, 6]
          		 array.each do
          		 	x = element[counter].to_i * array[counter].to_i
          		 	y += x         		 	
          		 	counter += 1
          		  end	
          if y % 11 == element[9].to_i 
             egn_valid.write element	     
          end  
      end             	
    end                   
egn_valid.close                  
          	