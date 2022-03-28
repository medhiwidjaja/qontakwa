defmodule Qontakwa.WATest do
  use ExUnit.Case
  alias Qontakwa.WA

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "sending WA message" do
    test "send valid request", %{bypass: bypass} do
      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 201, payload())
      end)

      url = "http://localhost:#{bypass.port}/"
      body = %{key: "value"}

      response = WA.send("62812000111333", "Bob", body, url: url)

      assert {:ok, %{status_code: 201}} = response
    end
  end

  defp payload do
    ~s({
      "complete": "true",
      "status_code": "201"
    })
  end
end
