defmodule Cards do
  @moduledoc """
    This module contains functions for creating, shuffling, and dealing a deck of cards.
  """
  @deckname "deck"
  @doc """
    Returns a list of strings representing a deck of cards.
  """
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

  @doc """
    Returns a list of strings representing a shuffled deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns true if the deck contains the hand, false otherwise.
  
  ## Examples
  
      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Clubs")
      true
  
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Returns a tuple containing the hand and the remaining deck.
    The `hand_size` represents the number of cards in the hand.
  
    ## Examples
  
      iex> deck = Cards.create_deck()
      iex> {hand, _remaining_deck} = Cards.deal(deck, 3)
      iex> hand
      ["Ace of Clubs", "Two of Clubs", "Three of Clubs"]
  
  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the deck to a file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads the deck from a file.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Creates a hand from a shuffled deck.
  """
  def create_hand do
    create_deck() |> shuffle() |> deal(5)
  end

  @doc """
    Executes the program.
  """
  def execute do
    create_hand() |> save(@deckname)
    load(@deckname) |> IO.inspect()
  end
end
