# Starting messages
puts "Enter \"end\" when done."

# Main program loop
while true
  print "Command: "
  command = gets.chomp.downcase

  case command
  when "end"
    puts "Stopping."
    break
  when "new"
    puts "TEST: insert new method here"
  else
    puts "ERROR: Command unknown."
  end
end
