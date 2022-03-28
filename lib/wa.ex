defmodule Qontakwa.WA do
  @moduledoc """
  This module interface with Qontak API to send Whatsapp message through their API
  """

  @base_url "https://chat-service.qontak.com/api/open/v1/broadcasts/whatsapp/direct"
  @message_template_id "f9c092ba-9e33-427a-af31-6a91d5ec084d"
  @channel_integration_id "22a75949-446a-4267-8ac2-1f105441d8fc"

  @doc """
  Send WA message through Qontak API.

  ## Examples

      iex> Qontakwa.send_wa_message(body)
      {:ok, response}

  """
  def send(to_number, to_name, body, opts \\ []) do
    headers = [
      {"content-type", "application/json"},
      {"authorization", "Bearer #{System.fetch_env!("QONTAK_TOKEN")}"}
    ]

    url = opts[:url] || @base_url
    message_template_id = opts[:message_template_id] || @message_template_id
    channel_integration_id = opts[:channel_integration_id] || @channel_integration_id

    payload = %{
      to_number: to_number,
      to_name: to_name,
      pin: "pin",
      message_template_id: message_template_id,
      channel_integration_id: channel_integration_id,
      language: %{
        code: "id"
      },
      parameters: %{
        body: body
      }
    }

    Mojito.post(url, headers, Jason.encode!(payload))
  end
end
