

# This is a Proc
football_players = lambda { |name, position| name + " " + position}

p football_players.call("Aaron Rodgers", "Quarterback")

# This is a Lambda
football_players_b = ->(name, position) { name + " " + position }

p football_players_b.call("Clay Matthews", "Linebacker")