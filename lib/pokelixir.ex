defmodule Pokelixir do
  @moduledoc """
  `Pokelixir` is a Pokémon API Client.
  """

  @doc """
  Retrieves Pokemon data with given id.

  ## Examples

      iex> Pokelixir.get_pokemon(1)
      "bulbasaur"

      iex> Pokelixir.get_pokemon(5000)
      "Not found :("

  """
  def get_pokemon(id) do
    HTTPoison.start
    case HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{id}/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, json} -> Map.fetch!(json, "name")
          {:error, _reason} -> "An error ocurred while decoding response"
        end
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
