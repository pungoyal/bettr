home = Team.create! :name => 'Uruguay', :code => 'URU'
away = Team.create! :name => 'North Korea', :code => 'KOR'
date = DateTime.new 2010, 6, 26
Match.create! :teams => [home, away], :date => date

home = Team.create! :name => 'United States', :code => 'USA'
away = Team.create! :name => 'Ghana', :code => 'GHA'
date = DateTime.new 2010, 6, 26
Match.create! :teams => [home, away], :date => date

home = Team.create! :name => 'Argentina', :code => 'ARG'
away = Team.create! :name => 'Mexico', :code => 'MEX'
date = DateTime.new 2010, 6, 27
Match.create! :teams => [home, away], :date => date

home = Team.create! :name => 'Germany', :code => 'GER'
away = Team.create! :name => 'England', :code => 'ENG'
date = DateTime.new 2010, 6, 27
Match.create! :teams => [home, away], :date => date

###############################
