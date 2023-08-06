defmodule Cards do
  @deckname "deck"
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

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def execute do
    Cards.create_deck() |> Cards.save(@deckname)
    Cards.load(@deckname) |> IO.inspect()
  end
end

Cards.execute()
