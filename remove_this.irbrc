# require 'rubygems' #needed for wirble
require 'irb/completion' # non-wirble auto-complete
require 'pp'
require 'wirble'

begin
  # init wirble
  Wirble.init
  Wirble.colorize
  rescue LoadError => err
  $stderr.puts "Couldn't load Wirble: #{err}"
end


IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

# loads simple IRB (without RVM notice)
IRB.conf[:PROMPT_MODE] = :SIMPLE

# loads awesome_print
require "awesome_print"
AwesomePrint.irb!

def clear
  system('clear')
end

puts ("Welcome to Ruby Console Topher")
