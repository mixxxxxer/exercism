class Tournament
  def self.table
    @table = {}
  end

  def self.print_result
    @res = "Team                           | MP |  W |  D |  L |  P\n"
    @table.sort_by{ |k,v| [-v[4].to_i, k]}.to_h.each {|team, stat|
      @res += "#{team.ljust(31)}|  #{stat[0]} |  #{stat[1]} |  #{stat[2]} |  #{stat[3]} |  #{stat[4]}\n"
    } if !@table.empty?
    return @res
  end
  def self.add_result(input)
    team_lines = []
    input.split("\n").each{|res|
      team_lines << res.split(";")
    }
    team_lines.each do |line|
      @table[line[0]] = [0, 0, 0, 0, 0] if !@table.include?(line[0])
      @table[line[1]] = [0, 0, 0, 0, 0] if !@table.include?(line[1])
      team1_score = @table[line[0]]
      team2_score = @table[line[1]]
      case line[2]
      when "win"
        team1_score[0] += 1
        team1_score[1] += 1
        team2_score[0] += 1
        team2_score[3] += 1
      when "loss"
        team1_score[0] += 1
        team1_score[3] += 1
        team2_score[0] += 1
        team2_score[1] += 1
      when "draw"
        team1_score[0] += 1
        team1_score[2] += 1
        team2_score[0] += 1
        team2_score[2] += 1
      end
    end
    @table.each do |key, value|
      value[4] = value[1] * 3 + value[2] if key != "Team"
    end
  end

  def self.tally(input)
    #return input.split("\n")
    table
    add_result(input)
    print_result
  end
end

