#!/usr/bin/env ruby
# This script takes in a bunch of hostnames, one per line, and runs csshX
# on all of them.
input = $stdin.read
hosts = input.split("\n")
command = "csshX \\\n" + hosts.join(" \\\n")
puts command
system(command)
