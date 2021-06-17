# Help method
def help
  puts <<~HELP
    Command / discription
    ----------------------------------------------
    help / displays this information
    new / creates a new item in the database
    end / saves the database and exits the program
  HELP
end

# Starting messages
help

# Main program loop
while true
  print "Command: "
  command = gets.chomp.downcase

  case command
  when "end"
    puts "Saving"
    puts "Exiting"
    break
  when "help"
    help
  when "new"
    puts "TEST: insert new method here"
  else
    puts "ERROR: Command unknown"
  end
end


