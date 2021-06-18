# Requires
require 'yaml'

# Global Variables Initializations
$inventory = Hash.new

# Write Inventory to YAML File
def write_to_yaml
  File.open("inventory.yml", "w") { |file| file.write($inventory.to_yaml) }
end

# Load Inventory
begin
  puts "Loading inventory"
  $inventory = YAML.load(File.read("inventory.yml"))
rescue Errno::ENOENT
  puts "No inventory file found, starting a new inventory"
  write_to_yaml
else
  puts "Inventory loaded"
end

# Help method
def help
  puts <<~HELP
    Command / discription
    ----------------------------------------------
    help / displays this information
    new / creates a new item in the database
    exit / saves the database and exits the program
  HELP
end

# New method
def new
  print "Item name: "
  name = gets.chomp.downcase
  print "Current on-hand: "
  current = gets.chomp.downcase
  $inventory[name] = current
  write_to_yaml
end

# Starting messages
help

# Main program loop
while true
  print "Command: "
  command = gets.chomp.downcase

  case command
  when "exit"
    puts "Saving"
    puts "Exiting"
    break
  when "help"
    help
  when "new"
    new
  else
    puts "ERROR: Command unknown"
  end
end


