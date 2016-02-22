require 'json'
require 'artii'

def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end

def section_break
	puts "-" * 30
	puts "*" *30
end

puts section_break

# Print "Sales Report" in ascii art
a = Artii::Base.new
puts a.asciify('Sales Report')

puts section_break

# Print today's date
puts "Today's Date: " + Time.now.strftime("%m/%d/%Y")
puts ""

# Print "Products" in ascii art
puts a.asciify('Products')

puts section_break

# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art
puts a.asciify('Brands')

# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined
