defmodule Qontakwa do
  @moduledoc """
  Documentation for `Qontakwa`.
  """
  alias Qontakwa.WA

  @doc """
  Send WA message to specified phone number and name.
  The body of message will use a default value, if not provided

  Example
    iex>   body = [
              %{key: "1", value: "full_name", value_text: "William Darcy"},
              %{key: "2", value: "pin", value_text: "12345"}
            ]
    iex> Qontakwa.send_wa_message "62818000111222", "Joko", body
    {:ok,
      %{....}
    }

    iex> Qontakwa.send_wa_message "628180INVALID", "Joko"
    {:error, "To number Not valid to_number (phone number)"}

  """
  def send_wa_message(to_phone, to_name, body, opts \\ []) do
    case WA.send(to_phone, to_name, body, opts) do
      {:ok, %{status_code: 201, body: response_body}} ->
        {:ok, response_body}

      {:ok, %{body: response_body}} ->
        %{"error" => %{"messages" => messages}} = Jason.decode!(response_body)
        {:error, messages |> Enum.join(", ")}
    end
  end
end
