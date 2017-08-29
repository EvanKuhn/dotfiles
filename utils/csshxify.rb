#!/usr/bin/env ruby
# This script takes in a bunch of hostnames, one per line, and runs csshX
# on all of them.
require 'optparse'

screen = 1
OptionParser.new do |opts|
  opts.on("--screen NUM", "Screen number") { |v| screen = Integer(v) }
end.parse!

input = $stdin.read
hosts = input.split("\n")
command = "csshX --screen #{screen} \\\n" + hosts.join(" \\\n")
puts command
system(command)
