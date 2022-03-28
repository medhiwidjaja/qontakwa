defmodule QontakwaTest do
  use ExUnit.Case

  describe "sending WA message" do
    setup do
      bypass = Bypass.open()
      {:ok, bypass: bypass}
    end

    test "send to a valid number", %{bypass: bypass} do
      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 201, payload())
      end)

      url = "http://localhost:#{bypass.port}/"

      assert {:ok, _} =
               Qontakwa.send_wa_message("62812000111333", "Bob", %{key: "value"}, url: url)
    end

    test "send to an invalid number", %{bypass: bypass} do
      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 422, errors())
      end)

      url = "http://localhost:#{bypass.port}/"

      assert {:error, "To number Not valid to_number (phone number)"} =
               Qontakwa.send_wa_message("62812INVALID", "Bob", %{key: "value"}, url: url)
    end
  end

  defp payload do
    ~s({
      "complete": "true",
      "status_code": "201"
    })
  end

  defp errors do
    "{\"error\":{\"messages\":[\"To number Not valid to_number (phone number)\"]}}"
  end
end
