#-----------------------------
# ToyCity Part 2
# Diane Van Etten
#-----------------------------

require 'json'  #https://rubygems.org/gems/json
require 'artii' #A small gem to generate ASCII art from text fed in to it https://rubygems.org/gems/artii

	#Rubric requires that Udacity included code not be changed, so I commented it out
	#path = File.join(File.dirname(__FILE__), '../data/products.json')
	#file = File.read(path)
	#products_hash = JSON.parse(file)

def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end

def section_break
	puts "-" * 30
	puts "*" *30
	puts ""
end

def ascii_art(art_title)
	a = Artii::Base.new :font => 'slant'
	puts a.asciify(art_title)
end

def todays_date
	puts "Today's Date: " + Time.now.strftime("%m/%d/%Y")
	puts ""
end

# def toys_loop
# 	$products_hash["items"].each do |toy|
# end

def toy_name
end

def products_section
end

def brands_section
end

def calculate_purchases
end

def calculate_sales
end

def calculate_avg_price
end

def calculate_avg_discount
end

def brand_name
end

def brands_toys
end

def sales_volume
end

# Print "Sales Report" in ascii art
	ascii_art('Sales Report')

	section_break

# Print today's date
	todays_date

# Print "Products" in ascii art
	ascii_art('Products')

	section_break

# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art
	ascii_art('Brands')

	section_break

# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined
