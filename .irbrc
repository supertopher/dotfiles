# Auto-complete for method names and such
require 'irb/completion'

# Awesomeprint replaces irb's default pretty printing with fancier formatting
require "awesome_print"
AwesomePrint.irb!

# Loads simple IRB (without RVM notice)
IRB.conf[:PROMPT_MODE] = :SIMPLE


IRB.conf[:AUTO_INDENT] = true

# A method for clearing the screen
def clear
  system('clear')
end

puts ("Loading ~/.irbrc a file that loads everytime you load irb")
