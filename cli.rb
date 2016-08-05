#!/usr/bin/env ruby

require_relative "./nfatic"

mode = "u"
if ARGV[0][0] == "-"
	mode = ARGV[0][1]
	text = File.read(ARGV[1])
else
	text = File.read(ARGV[0])
end

puts mode == "h" ? toHTML(text) : toUTF8(text)
