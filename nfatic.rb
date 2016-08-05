           #0123456789ABCDEF
$code437 = " ☺☻♥♦♣♠•◘○◙♂♀♪♫☼"\
           "►◄↕‼¶§▬↨↑↓→←∟↔▲▼"\
           " !"              \
            "\"#$%&'()*+,-./"\
           "0123456789:;<=>?"\
           "@ABCDEFGHIJKLMNO"\
           "PQRSTUVWXYZ["    \
                      "\\]^_"\
           "`abcdefghijklmno"\
           "pqrstuvwxyz{|}~⌂"\
           "ÇüéâäàåçêëèïîìÄÅ"\
           "ÉæÆôöòûùÿÖÜ¢£¥₧ƒ"\
           "áíóúñÑªº¿⌐¬½¼¡«»"\
           "░▒▓│┤╡╢╖╕╣║╗╝╜╛┐"\
           "└┴┬├─┼╞╟╚╔╩╦╠═╬╧"\
           "╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀"\
           "αßΓπΣσµτΦΘΩδ∞φε∩"\
           "≡±≥≤⌠⌡÷≈°∙·√ⁿ²■ "  #F

$control = {
	0x0a => "\n",
	0x0d => "\r",
}

def toHTML(text)
	recoded = ""
	for byte in text.bytes
		if $control.has_key?(byte)
			char = $control[byte]
		else
			char = $code437[byte]
			if byte == 0xFF
				char = "&nbsp;"
			elsif byte < 0x20 || byte > 0x7E
				char = "&#%i;" % char.ord
			end
		end
		recoded += char
	end
	return "<pre>%s</pre>" % recoded
end

def toUTF8(text)

	recoded = ""
	for byte in text.bytes
		recoded += $control.has_key?(byte) ? $control[byte] : $code437[byte]
	end
	return recoded
end
