defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Returns a deck.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffles and returns a shuffled deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns true or false if a card exists in a deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Returns a deal from the deck
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  saves the deck in the file system
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  loads the deck from the file system
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> 'That file does not exist'
    end
  end

  @doc """
  creates a hand of cards
  """
  def create_hand(hand_size) do
    # because we are using the pipe operator we no long have to pass the first argument, which is passed automatically
    # Remember, the pipe operator demands consistent first arguments to operate well !!!
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
