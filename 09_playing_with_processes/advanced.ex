# Spawning Processes from Modules

defmodule Bounce do
  def report do
    receive do
      msg -> IO.puts("Received #{msg}")
      report()
    end
  end
end

# Now we spawn a process that "receives" messages via the Bounce.report/0 function.
# ```
# pid = spawn(Bounce, :report, [])
# ```

# Registering Processes
#
# You can register a procces to map it to an atom, so that you do not have to remember the PID.

# ```
# pid1 = spawn(Bounce, :report, [])
#
# Process.register(pid1, :bounce)
#
# send(:bounce, :hello)
#
# Process.whereis(:bounde)
# Process.unregister(:bounce)
# ```
