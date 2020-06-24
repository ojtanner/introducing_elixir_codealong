# Process Basics:
# ======================
#
# Elixir is a syntax for Erlang. And Erlang is built around distributed programming.
# That means that Elixir programms are built around multiple procceses, instead of just one.

# Extract PID of a proces
self()

# Process handling is built around message passing and mailboxes.
#
# Important to know: Elixir and Erlang will NOT report that:
# - Message-send failed
# - Message was ignored by receiver / consumer
# As far as i know, Elixir and Erlang are built around the concept of "fail then recover"

# Messages are sent using the "send" funtcion.
send(self(), "Hello, future me")

# To see what's inside a mailbox, you can use the function "flush"
#
# Important to know: "flush" does exactly what it says. After flushing,
# the messages are GONE.

# flush() | note that flush only works in the iex

# To properly receive and handle a message, you use the "receive ... end" construct.
# Please note that receive is a blocking operation! You can hang your terminal by that.

receive do
  x -> x
end

# Now let's put that to use!

defmodule Basics do
  def report do
    receive do
      msg -> IO.puts("Received #{msg}")
    end
  end
end

# Now open iex and do the following:
# ```
# pid = spawn(Basics, :report, [])
#
# send(pid, "hello there")
# ```
