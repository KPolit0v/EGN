entered_egn = ARGV.first

class EGN 
 def initialize(entered_egn)
   @entered_egn = entered_egn
   @egn_size = @entered_egn.length
   @year = 0
 end


 def check_date
 	egn_check_size
 	digits_egn
 	which_month
 	which_day
 	gender_check
 	which_town
 	egn_check
 	egn_data
 end 

 def egn_check_size
 	if @egn_size.equal?10
 	else 
 		puts 'invalid'
 	 end
 end

 def digits_egn
 	@array_egn ||= @entered_egn.split(//).map(&:to_i)
 end

 def which_month
 	@month_str = @array_egn[2..3].join
 	@month = @month_str.to_i
 	if (41..52).cover?@month
 		@month = @month - 40
 		year_before_2k
 		puts @month
    elsif (1..12).cover?(@month)
 		year_after_2k
 		puts @month
 	else 
 		puts 'invalid'
 	end
 end

 def year_before_2k
    @year_str = @array_egn[0..1].join
    @year = 2000 + @year_str.to_i
    puts @year
 end

 def year_after_2k
    @year_str = @array_egn[0..1].join 
    @year = 1900 + @year_str.to_i
    puts @year
 end

 def which_day
    @day_str = @array_egn[4..5].join
    @day = @day_str.to_i
    case
    when @month.odd? && @day <= 31
     puts @day
    when  @month == 2 && (@year % 4).zero? && @day <= 29
     puts @day
    when  @month == 2 && (@year % 4) != 0 && @day <= 28
     puts @day
    when (@month % 2).zero? && @month != 2 && @day <= 30
     puts @day
    else
     puts "invalid" 
     end
  end

  def gender_check
  	if @array_egn[8].odd?
  		puts 'famale'
  	else
  		puts 'male'
  	end
  end

  def which_town
  	@town = @array_egn[6..8].join
  	@town = @town.to_i
  	case 
  	when (0...43).cover?(@town)
  		puts 'Благоевград'
  	when (43...93).cover?(@town)
  		puts 'Бургас'	
	when (93...139).cover?(@town)
  		puts 'Варна'
  	when (139...169).cover?(@town)
  		puts 'Велико Търново'
  	when (169...183).cover?(@town)
  		puts 'Видин'
  	when (183...217).cover?(@town)
  		puts 'Враца'
  	when (217...233).cover?(@town)
  		puts 'Габрово'
  	when (233...281).cover?(@town)
  		puts 'Кърджали'	
  	when (281...301).cover?(@town)
  		puts 'Кюстендил'
  	when (301...319).cover?(@town)
  		puts 'Ловеч'	
	when (319...341).cover?(@town)
  		puts 'Монтана'
  	when (341...377).cover?(@town)
  		puts 'Пазарджик'
  	when (377...395).cover?(@town)
  		puts 'Перник'
  	when (395...435).cover?(@town)
  		puts 'Плевен'
  	when (435...501).cover?(@town)
  		puts 'Пловдив'
  	when (501...527).cover?(@town)
  		puts 'Разград'	
  	when (527...555).cover?(@town)
  		puts 'Русе'
  	when (555...575).cover?(@town)
  		puts 'Силистра'	
	when (575...601).cover?(@town)
  		puts 'Сливен'
  	when (601...623).cover?(@town)
  		puts 'Смолян'
  	when (623...721).cover?(@town)
  		puts 'София – град '
  	when (721...751).cover?(@town)
  		puts 'София – окръг'
  	when (751...789).cover?(@town)
  		puts 'Стара Загора'
  	when (789...821).cover?(@town)
  		puts 'Добрич'	
  	when (821...843).cover?(@town)
  		puts 'Търговище'
  	when (843...871).cover?(@town)
  		puts 'Хасково'	
	when (871...903).cover?(@town)
  		puts 'Шумен'
  	when (903...925).cover?(@town)
  		puts 'Ямбол'
  	when (925...999).cover?(@town)
  		puts 'Друг'
  	end
  end

  def egn_calculation
	array_formula = [2, 4, 8, 5, 10 ,9, 7, 3 ,6]
	@array_result = @array_egn.take(9)
	x = 0
	@array_result.each do 
		@array_result[x] = @array_result[x] * array_formula[x]
		x += 1
	end
	@array_result = @array_result.sum % 11
  end

  def egn_check
  	
  	if @array_result == @array_egn[10]
  		puts 'card is valid'
  		
  	else 
  		puts 'invalid'
  	end
  end
   def egn_data
      puts "#{@year}-#{@month_str}-#{@day_str}"
   end
end









x = EGN.new(entered_egn)
x.check_date

