SimpleCov.command_name(ENV['FOG_MOCK'] == "true" ? "mock" : "real")
SimpleCov.start do
  add_filter "spec/"
end
