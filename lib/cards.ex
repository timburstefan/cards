defmodule Cards do
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six"
    ]

    suits = [
      "Clubs",
      "Diamonds",
      "Hearts",
      "Spades"
    ]

    cards =
      for value <- values do
        for suit <- suits do
          "#{value} of #{suit}"
        end
      end

    List.flatten(cards)
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def hello_wrld do
    "Hello World"
  end
end
