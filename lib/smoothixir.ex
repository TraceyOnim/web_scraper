defmodule Smoothixir do
  @moduledoc """
  Documentation for `Smoothixir`.
  """

  def smoothies_url do
    case _url() |> HTTPoison.get() do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        urls =
          body
          |> Floki.find("a.fixed-recipe-card__title-link")
          |> Floki.attribute("href")

        {:ok, urls}

      {:ok, _response} ->
        IO.puts("Not found")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  defp _url do
    "https://www.allrecipes.com/recipes/138/drinks/smoothies/?internalSource=hubcard&referringContentType=Search&clickId=cardslot%201"
  end
end
