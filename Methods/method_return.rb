@players = true
@position = true


def football_players
  return ["Aaron Rodgers", "Randall Cobb"] if @players == true
   return ["Quarterback", "Wide Receiver"] if @position == true
  
end

puts football_players