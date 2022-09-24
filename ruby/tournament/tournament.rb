class Tournament
  def self.table
    @table = {"Team" => ["MP", "W", "D", "L", "P"]}
  end

  def self.print_result
    @res = ""
    @table.each {|team, stat|
      @res += "#{team.ljust(31)}| #{stat[0]} |  #{stat[1]} |  #{stat[2]} |  #{stat[3]} |  #{stat[4]}\n"
    }
    return @res
  end

  def self.add_result(input)
    her = []
    input.split("\n").each{|res|
      her << res.split(";")
    }
    return her
  end

  def self.tally(input)
    #return input.split("\n")
    table
    #print_result
    add_result(input)
  end
end