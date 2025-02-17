require './lib/turn'
require './lib/game'
require 'pry'

print "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"

deck_of_cards = []
card_v_r = {"Ace" => 4, "2" => 2, "3" =>3, "4" => 4, "5" =>5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 11, "Q" => 12, "K" => 13}
suits = [:spade, :club, :heart, :diamond]

i = 0
 until i == 4
   i +=1
   j = 0
  until j == 13
     j += 1
     deck_of_cards << Card.new(suits[i-1], card_v_r.keys[j-1], card_v_r.values[j-1])
  end

 end

shuffled_cards = deck_of_cards.shuffle
deck1 = Deck.new(shuffled_cards[0..25])
deck2 = Deck.new(shuffled_cards[26..51])
deck3 = Deck.new([])


#mock cards for trouble shooting
# deck1 = Deck.new(shuffled_cards[0..3])
# deck2 = Deck.new(shuffled_cards[4..7])

# binding.pry
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
discard = Player.new("Discard Pile", deck3)
turn = Turn.new(player1, player2, discard)
user_response = $stdin.gets.chomp

if user_response == "GO"

  game = Game.new(turn)
  # binding.pry
  @turn = turn
  game.start
else
  print "Your loss!"
end
