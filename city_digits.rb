# frozen_string_literal: true

class CityDigits
  def initialize(array, city)
    @city = city
    @array_first = array
    @array_first_group = %w[bl bu va vi vr]
    @array_secound_group = %w[ga ky kq lo mo]
    @array_third_group = %w[pa pe ple plo ra ru]
    @array_fourth_group = %w[si sl sm so_gr so_ob st]
    @array_fifth_group = %w[do ty ha shu qm dr]
  end

  def city_selector
    if @array_first_group.include?(@city) then city_first_group
    elsif @array_secound_group.include?(@city) then city_secound_group
    elsif @array_third_group.include?(@city) then city_third_group
    elsif @array_fourth_group.include?(@city) then city_fourth_group
    elsif @array_fifth_group.include?(@city) then city_fifth_group
    else
      puts 'invalid city'
    end
  end

  private

  def city_fourth_group
    @city_digits = DelegateHash.new(self, { 'si' => :city_digits_silistra,
                                            'sl' => :city_digits_sliven,
                                            'sm' => :city_digits_smolqn,
                                            'so_gr' => :city_digits_sofia_grad,
                                            'so_ob' => :city_digits_sofia_okryg,
                                            'st' => :city_digits_stara_zagora })

    @city_digits[@city]
  end

  def city_fifth_group
    @city_digits = DelegateHash.new(self, { 'do' => :city_digits_dobrich,
                                            'ty' => :city_digits_tyrgovishte,
                                            'ha' => :city_digits_haskovo,
                                            'shu' => :city_digits_shumen,
                                            'qm' => :city_digits_qmbol,
                                            'dr' => :city_digits_drug })
    @city_digits[@city]
  end

  def city_secound_group
    @city_digits = DelegateHash.new(self, { 'ga' => :city_digits_gabrovo,
                                            'ky' => :city_digits_kyrjali,
                                            'kq' => :city_digits_kiustendil,
                                            'lo' => :city_digits_lovech,
                                            'mo' => :city_digits_montana })

    @city_digits[@city]
  end

  def city_third_group
    @city_digits = DelegateHash.new(self, { 'pa' => :city_digits_pazardjik,
                                            'pe' => :city_digits_pernik,
                                            'ple' => :city_digits_pleven,
                                            'plo' => :city_digits_plovdiv,
                                            'ra' => :city_digits_razgrad,
                                            'ru' => :city_digits_ruse })

    @city_digits[@city]
  end

  def city_first_group
    @city_digits = DelegateHash.new(self, { 'bl' => :city_digits_blagoevgrad,
                                            'bu' => :city_digits_burgas,
                                            'va' => :city_digits_varna,
                                            've' => :city_digits_veliko_tyrnovo,
                                            'vi' => :city_digits_vidin,
                                            'vr' => :city_digits_vraca })

    @city_digits[@city]
  end

  def city_digits_blagoevgrad
    @range = 0...43
    @counter = 0
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.blagoevgrad_body
  end

  def city_digits_burgas
    @range = 43...93
    @counter = 44
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.burgas_body
  end

  def city_digits_varna
    @range = 93...139
    @counter = 93
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.varna_body
  end

  def city_digits_veliko_tyrnovo
    @range = 139...169
    @counter = 139
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_vidin
    @range = 169...183
    @counter = 169
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_vraca
    @range = 183...217
    @counter = 183
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_gabrovo
    @range = 217...233
    @counter = 217
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_kyrjali
    @range = 233...281
    @counter = 233
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_kiustendil
    @range = 281...301
    @counter = 281
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_lovech
    @range = 301...319
    @counter = 301
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_montana
    @range = 319...341
    @counter = 319
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_pazardjik
    @range = 341...377
    @counter = 341
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_pernik
    @range = 377...395
    @counter = 377
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_pleven
    @range = 395...435
    @counter = 395
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_plovdiv
    @range = 435...501
    @counter = 435
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_razgrad
    @range = 501...527
    @counter = 501
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_ruse
    @range = 527...555
    @counter = 527
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_silistra
    @range = 555...575
    @counter = 555
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_sliven
    @range = 575...601
    @counter = 575
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_smolqn
    @range = 601...623
    @counter = 601
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_sofia_grad
    @range = 623...721
    @counter = 623
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_sofia_okryg
    @range = 721...751
    @counter = 721
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_stara_zagora
    @range = 751...789
    @counter = 751
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_dobrich
    @range = 789...821
    @counter = 789
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_tyrgovishte
    @range = 821...843
    @counter = 821
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_haskovo
    @range = 843...871
    @counter = 843
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_shumen
    @range = 871...903
    @counter = 871
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_qmbol
    @range = 903...925
    @counter = 903
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end

  def city_digits_drug
    @range = 925...999
    @counter = 925
    @city_digits_generate = CityDigitsCalc.new(@array_first, @range, @counter)
    @city_digits_generate.array_cycle
  end
end
