namespace :db do
  desc "Refresh database"
  task :refresh => [:drop, :create, :migrate, :seed, :pump]

  desc "Pump dummy data into the db"
  task :pump do
    (1..10).each do |i|
      username = "user" + i.to_s
#      User.create! :username => username, :email => "#{username}@puneetgoyal.net", :password => username, :password_confirmation => username
      User.create! :username => username, :email => "#{username}@puneetgoyal.net"
    end

    users = User.all
    for match in Match.all
      number_of_bets = rand(20)
      (1..number_of_bets).each do
        users.shuffle![0].place_bet match, match.teams.shuffle![0], rand(10)+1
      end
    end
  end
end
