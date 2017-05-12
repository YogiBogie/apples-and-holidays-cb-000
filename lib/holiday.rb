require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.collect do |key, value|
    if key == :winter
        value.collect do |holiday, supplies|
          supplies << supply
        end
    end
  end

  return holiday_hash

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.collect do |key, value|
    value.collect do |holiday, supplies|
      if holiday == :memorial_day
        supplies << supply
      end
    end
  end

  return holiday_hash

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.collect do |key, value|
    if key == season
      holiday_hash[season].store(holiday_name, supply_array)
    end
  end

  return holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  a=[]
  
  holiday_hash.each do |key, value|
    if key == :winter
      value.each do |holiday, supplies|
        supplies.each do |array|
          a << array
        end
      end
    end
  end

  return a        

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  count = 0
  
  holiday_hash.each do |season,holidays|
    a = ""
    
    if count == 0
      puts "#{season.to_s.capitalize}:"#puts holiday
    end
    
    holidays.each do |holiday, supplies|
      b = holiday.to_s.split("_")
      b.collect do |word|
        word.capitalize!
      end #closes b.collect
      b = b.join(" ")
      a = "  #{b}: "
      supplies.each do |supply|
        c = supply.split(" ")
        c.collect do |words|
          if words.capitalize == "Bbq"
            words = "BBQ"
          else
            words.capitalize!
          end
        end #closes c.collect
        c = c.join(" ")
        a += c
        if supplies.length > 1 && supply != supplies[supplies.length-1]
          a += ", "
        elsif supply == supplies[supplies.length-1]
          puts a
        end #closes if condition addiing 'c' in between supplies
      end # closed s.each
      
      a = "" # reset string a to empty string for next iteration
    end#closes v.each
    count = 0
  end #close holiday_hash.each
  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
 a = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      supplies.each do |supply|
        if supply == "BBQ"
          a << holiday
        end
      end
    end
  end

return a  

end







