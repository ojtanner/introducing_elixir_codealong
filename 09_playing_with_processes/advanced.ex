# Spawning Processes from Modules

defmodule Bounce do
  def report do
    receive do
      msg ->
        IO.puts("Received #{msg}")
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

# Processes can talk between each other

defmodule Drop do
  def drop do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(planemo, distance)})
        drop()
    end
  end

  defp fall_velocity(:earth, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:moon, distance) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  defp fall_velocity(:mars, distance) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end

defmodule MphDrop do
  def mph_drop do
    drop_id = spawn(Drop, :drop, [])
    convert(drop_id)
  end

  def convert(drop_id) do
    receive do
      {planemo, distance} ->
        send(drop_id, {self(), planemo, distance})
        convert(drop_id)

      {planemo, distance, velocity} ->
        mph_velocity = 2.23693629 * velocity
        IO.write("On #{planemo}, a fall of #{distance} meters ")
        IO.puts("yields a velocity of #{mph_velocity} mph.")
        convert(drop_id)
    end
  end
end

# In IEX execute
# ```
# pid1 = spawn(MphDrop, :mph_drop, [])
# send(pid1, {:earth, 20})
# ```
#
# This will now create a process that delegates work to another process.

# If you want to be able to intercept when a process fails instead of silently ignoring it, do the following trapping.

defmodule MphDropWithFailureTrap do
  def mph_drop do
    Process.flag(:trap_exit, true)
    drop_id = spawn_link(Drop, :drop, [])
    convert(drop_id)
  end

  def convert(drop_id) do
    receive do
      {:EXIT, pid, reason} ->
        IO.puts("Failure: #{inspect(pid)} #{inspect(reason)}")
      {planemo, distance} ->
        send(drop_id, {self(), planemo, distance})
        convert(drop_id)

      {planemo, distance, velocity} ->
        mph_velocity = 2.23693629 * velocity
        IO.write("On #{planemo}, a fall of #{distance} meters ")
        IO.puts("yields a velocity of #{mph_velocity} mph.")
        convert(drop_id)
    end
  end
end

