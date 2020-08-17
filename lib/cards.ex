defmodule Cards do
  @moduledoc """
  Provides methos for creating and handling a deck of cards.
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

  ## Examples
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The 'hand_size' argument indicates how many cards should
    be in the hand.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

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
