# https://ruby-doc.org/core-2.2.0/Proc.html

#  Proc objects are blocks of coede that have been bound to a set of local 
# variables.  once bound, the code may be called in different contexts and still 
# access those variables.

football_players = Proc.new {|name, position| name + " " + position}

football_players_b = Proc.new do |name, position| 
  name.upcase + " " + position.upcase
end

football_players_c = Proc.new do |name, position| 
  name + " " + position * 3
end

# There are two different ways to print these out
p football_players["Aaron Rodgers", "Quarterback"]

p football_players_b["Randall Cobb", "Wide Receiver"]

p football_players_c.call("James Stark", "Running Back")