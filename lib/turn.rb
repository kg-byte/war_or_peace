

# require_relative 'card'
# require_relative 'deck'

require_relative 'card'
require_relative 'deck'
require_relative 'player'

require 'pry'
#commented .cards in line 26 27

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :spoils_count
  def initialize(player1, player2, discard)

    @player1 = player1
    @player2 = player2
    @discard = discard
    @spoils_of_war = []


  end
# binding.pry
  #

  # player2_0 = @player2.deck.cards[0].rank
  # player1_2 = @player1.deck.cards[2].rank
  # player2_2 = @player2.deck.cards[2].rank
# binding.pry

  def type
    # binding.pry
     @player1_c = @player1.deck.cards
     @player2_c = @player2.deck.cards
     if @player1_c.count >= 3 and @player2_c.count >= 3
       if @player1_c[0].rank != @player2_c[0].rank
         :basic
       else
         if @player1_c[2].rank != @player2_c[2].rank
           :war
         else
           :mutually_assured_destruction
         end
       end
     end
    # if find_rank_of_card(@player1, 0) != find_rank_of_card(@player2, 0)
    #   return :basic
    # elsif find_rank_of_card(@player1, 0) == find_rank_of_card(@player2, 0) && find_rank_of_card(@player1, 2) == find_rank_of_card(@player2, 2)
    #   return :mutually_assured_destruction
    # elsif find_rank_of_card(@player1, 0) == find_rank_of_card(@player2, 0)
    #   return :war
    # end
  end

#a method built to find card rank of a player
  # def find_rank_of_card(player, index)
  #    player.deck.cards[index].rank
  # end

  def winner
    type
    if type == :basic
      if  @player1_c[0].rank > @player2_c[0].rank
        return @player1
      else
        return @player2
      end
    elsif type == :war
      if @player1_c[2].rank > @player2_c[2].rank
        return @player1
      else
        return @player2
      end
    elsif type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    @spoils_of_war = []
    if type == :basic
      #binding.pry
      spoils_of_war << @player1.deck.remove_card
      spoils_of_war << @player2.deck.remove_card

    elsif type == :war
      3.times do
        spoils_of_war << @player1.deck.remove_card
        spoils_of_war << @player2.deck.remove_card
      # binding.pry
      end
      # binding.pry
    elsif type ==:mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end

    end

  end

  def spoils_count

    spoils_of_war_o = @spoils_of_war
    @spoils_count = spoils_of_war_o.count.to_s
  end
# binding.pry

  def award_spoils(winner)
    winner

# binding.pry everything is ok
    # if winner == []
      if winner == @player1 || winner == @player2
        winner.deck.cards.concat(spoils_of_war)
      elsif winner == "No Winner"
        @discard.deck.cards.concat(spoils_of_war)
      end

 end
    # end
  # binding.pry
    # spoils_of_war.clear
  # binding.pry


end
