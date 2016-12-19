Before do
  $driver.start_driver.manage.timeouts.implicit_wait = 20 # seconds
end

After do
  $driver.driver_quit
end
