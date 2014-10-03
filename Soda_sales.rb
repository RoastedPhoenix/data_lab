f= File.new("Coca-Cola_sales.dat", "r")
sales_data = f.readlines
f.close

sum = 0
sales_data.each do |sale_data|
	sum = sum + sale_data.to_f
end
mean = sum/72
print "The mean is ", mean.to_s
puts ""
sorted_data = sales_data.sort
median_1 = sorted_data[35].to_f
median_2 = sorted_data[36].to_f
median = (median_1+median_2)/2
print "The median is ", median.to_s
puts ""
range_1 = sorted_data[0].to_f
range_2 = sorted_data[71].to_f
print "The range is ", range_1.to_s, " - ", range_2.to_s
bv = 0
sales_data.each do |sale_data|
	variant = (sale_data.to_f - mean.to_f)**2
	bv = bv + variant
end
a = bv/72
σ = a**0.5
puts ""
print "The standard deviation is ", σ.to_s
puts ""
f = File.new("Soda_z_scores", "w")
sales_data.each do |dummy|
	dumber = dummy
	Ω = dumber.to_f - mean
	z_score = Ω/σ
	f.print dumber.to_f, ",", "	", z_score.to_s
	f.puts ""
end
f.close
