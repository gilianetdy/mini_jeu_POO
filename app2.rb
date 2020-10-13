require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome_message 
puts "----------------------------------------------------------"
puts " Bienvenue sur 'Ils veulent tous ma POO'!"
puts "Le but du jeu est d'être le dernier survivant !"
puts "----------------------------------------------------------"
end 

enemies = Array.new 
player2 = Player.new("Josiane")
player3 = Player.new("José")
enemies.append(player2, player3)

puts "Quel est ton prénom ? "
name = gets.chomp
player1 = HumanPlayer.new(name)
puts player1.show_state

puts "#{player2.name} et #{player3.name} rejoignent le combat "

while player1.life_points > 0 && (player2.life_points >0 || player3.life_points >0)
    puts "Que veux-tu faire ?"
    puts "--- Entre 'a' pour partir à la recherche d'une arme-----------"
    puts "--- Entre 's' pour partir à la recherche  d'un pack de soin---"
    puts "--- Entre '0' pour attaquer Josiane qui a #{player1.life_points} points"
    puts "--- Entre '1' pour attaquer José qui a #{player2.life_points} points"
    print "> "
    action = gets.chomp.to_s
        if action == "a" # if 'a' get a weapon
            player1.search_weapon
          elsif action == "s" # if 's' get a health pack
            player1.search_health_pack
          elsif action == "0" # if '0' user attaks 'Josiane'
            player1.attacks (player2)
          elsif action == "1" # if '1' user attaks 'José'
            player1.attacks (player3)
          elsif action == "2" # if '2' 'Josiane' and 'José' attak user
        end 

        puts "Les autres joueurs t'attaquent !"

        enemies.each { |i| i.life_points <= 0 ? break : i.attacks(player1) }
        end  
    puts "La partie est finie"

    if player1.life_points == 0 
    puts "Loser - tu as perdu !"
    else 
    puts "Bravo! TU AS GAGNE !"
    end  

binding.pry