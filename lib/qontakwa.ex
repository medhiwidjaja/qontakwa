defmodule Qontakwa do
  @moduledoc """
  Documentation for `Qontakwa`.
  """
  alias Qontakwa.WA

  @body [
    %{
      key: "1",
      value: "full_name",
      value_text: "William Darcy"
    },
    %{
      key: "2",
      value: "pin",
      value_text: "123445"
    }
  ]

  @doc """
  Send WA message to specified phone number and name.
  The body of message will use a default value, if not provided

  Example
    iex> Qontakwa.send_wa_message "62818000111222", "Joko"
    {:ok,
    %Mojito.Response{
      body: "{...}",
      complete: true,
      headers: [...],
      size: 1111,
      status_code: 201
    }
  """
  def send_wa_message(to_phone, to_name, body \\ @body) do
    WA.send(to_phone, to_name, body)
  end
end
