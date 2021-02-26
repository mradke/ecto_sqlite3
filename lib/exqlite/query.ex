defmodule Exqlite.Query do
  @moduledoc """
  Query struct returned from a successfully prepared query.
  """
  @type t :: %__MODULE__{
          statement: iodata(),
          name: atom() | String.t(),
          ref: reference() | nil
        }

  defstruct statement: nil,
            name: nil,
            ref: nil

  defimpl DBConnection.Query do
    def parse(query, _opts) do
      query
    end

    def describe(query, _opts) do
      query
    end

    # TODO: See also Connection.bind/3
    #
    # def encode(%{ref: nil} = query, _params, _opts) do
    #   raise ArgumentError, "query #{inspect(query)} has not been prepared"
    # end
    #
    # def encode(%{num_params: nil} = query, _params, _opts) do
    #   raise ArgumentError, "query #{inspect(query)} has not been prepared"
    # end
    #
    # def encode(%{num_params: num_params} = query, params, _opts)
    #     when num_params != length(params) do
    #   message =
    #     "expected params count: #{inspect(num_params)}, got values: #{inspect(params)}" <>
    #       " for query: #{inspect(query)}"
    #
    #   raise ArgumentError, message
    # end

    def encode(_query, params, _opts) do
      params
    end

    def decode(_query, result, _opts) do
      result
    end
  end

  defimpl String.Chars do
    def to_string(%{statement: statement}) do
      IO.iodata_to_binary(statement)
    end
  end
end
