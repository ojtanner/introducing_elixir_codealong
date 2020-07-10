# *****************************************************************************
# Exceptions, Errors and Debugging ********************************************
# *****************************************************************************
#
# Elixir has Runtime and Logic errors.
# Runtime-errors are errors that can crash the app.
# Logic-errors produce undesired results.

# =============================================================================
# Rescuing Code From Runtime Errors ===========================================
# =============================================================================
#
# You can recover from errors via the
# ```
#    try do (expression)
#    rescue (match error)
#    end
# ```
# block
#
# Note: Sometimes you should just let the process crash and start a new one.
#   But i am not qualified as to say when to do what.

defmodule DropWithRescue do
  require Logger
  def fall_velocity(planemo, distance) do
    gravity = case planemo do
      :earth -> 9.8
      :moon -> 1.6
      :mars -> 3.71
    end
    try do
      :math.sqrt(2 * gravity * distance)
      rescue
        _error -> Logger.error("Something went wrong!")
    end
  end
end

# =============================================================================
# Logging Information =========================================================
# =============================================================================
#
# Elixir provides a functionality for logging information instead of just
# printing everything to the stdout.
# There are the standard 4 logging levels: info, debug, warn, error
#
# See line 35 for an example.
