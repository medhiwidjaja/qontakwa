# Qontakwa

Test project to experiment with Qontak's Whatsapp API 

# Installation

This project assumes you have Elixir version 1.12. If not, please
install it first.

Clone this repo to your machine, and then do:

```
$ cd qontakwa
$ mix deps.get
```

## Environment variables:

- Copy the file .env.example to .env
- Put your Qontak TOKEN in there, and then

```
$ source .env
```

## Running the tests:

```
$ mix test
```

## Sending WA message

```
$ iex -S mix
```

Enter the following codes at the iex prompt.
Replace the phone number below with your real WA phone number 
if you want to receive a message.

```
iex> body = [%{key: "1", value: "full_name", value_text: "William Darcy"},
             %{key: "2", value: "pin", value_text: "12345"}]
iex> phone = "62888111000999"
iex> name = "Bpk. Budi"
iex> Qontakwa.send_wa_message phone, name
```

You should get a message sent to your phone

## The End
Thank you!




