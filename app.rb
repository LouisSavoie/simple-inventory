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
    new / creates a new item
    find / look up an item
    edit / edits an item's name or count
    delete / deletes an item
    exit / exits the program
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

# Find method
def find
  print "Item name: "
  name = gets.chomp.downcase
  if $inventory.include?(name)
    puts "#{name}, On-hand: #{$inventory[name]}"
  else
    puts "ERROR: Item does not exist"
  end
end

# Edit method
def edit
  print "Item name: "
  name = gets.chomp.downcase
  if $inventory.include?(name)
    while true
      print "Edit #{name}'s name or count: "
      choice = gets.chomp.downcase
      case choice
      when "exit"
      break
      when "name"
        print "New name: "
        new_name = gets.chomp.downcase
        $inventory[new_name] = $inventory[name]
        $inventory.delete(name)
        write_to_yaml
        puts "Inventory updated"
        break
      when "count"
        print "Count: "
        count = gets.chomp
        $inventory[name] = count
        write_to_yaml
        puts "Inventory Updated"
        break
      else
        puts "ERROR: Command unknown"
      end
    end
  else
    puts "ERROR: Item does not exist"
  end
end

# Delete method
def delete
  print "Item name: "
  name = gets.chomp.downcase
  if $inventory.include?(name)
    $inventory.delete(name)
    write_to_yaml
    puts "Inventory updated"
  else
    puts "ERROR: Item does not exist"
  end
end

# Starting messages
help

# Main program loop
while true
  print "Command: "
  command = gets.chomp.downcase

  case command
  when "exit"
    puts "Exiting"
    break
  when "help"
    help
  when "new"
    new
  when "find"
    find
  when "edit"
    edit
  when "delete"
    delete
  else
    puts "ERROR: Command unknown"
  end
end


