
#ls = [ [3, 1, 6, 2], [3, 6, 6, 2], [7, 2, 6, 2] ]
ls = [ [2, 5, 4, 1], [2, 5, 5, 4], [1, 6, 5, 4] ]


masks = [];
vals = [];
texts = [];

for i in 0..26 do
	
	# init
	j = 0
	d = i
	masks[i] = 0
	vals[i] = 0
	texts[i] = ""
	while d != 0 do
		r = d % 3
		d = d / 3

		if r == 2 then
			masks[i] |= 1 << j
			texts[i] = "*" + texts[i]
		elsif r == 1 then
			vals[i] |= 1 << j
			texts[i] = "1" + texts[i]
		else
			texts[i] = "0" + texts[i]
		end
		j += 1
	end
	texts[i] = texts[i].rjust(3, "0")

	# output
	outp = (i + 1).to_s + "," + texts[i] + ","
	
	ls.each do |gen|
		
		m = 0
		fsum = 0.0
		
		gen.each do |val|
			
			if ((val & (masks[i] ^ 7)) == vals[i]) then
				m += 1
				fsum += val
			end
			
		end
		
		f = m > 0 ? fsum / m : 0;
		
		outp += m.to_s + "," + f.to_s + ","
		
	end
	
	#outp += vals[i].to_s + "," + masks[i].to_s
	
	puts outp
	
end


