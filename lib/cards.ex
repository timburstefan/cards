defmodule Cards do
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five"
    ]

    suits = [
      "Clubs",
      "Diamonds",
      "Hearts",
      "Spades"
    ]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end

Cards.create_deck() |> Cards.deal(4) |> IO.inspect()
# Cards.create_map() |> Cards.iterate_map() |> IO.inspect()
