#-----------------------------
# ToyCity Part 2
# Diane Van Etten
#-----------------------------

require 'json'  #https://rubygems.org/gems/json
require 'artii' #A small gem to generate ASCII art from text fed in to it https://rubygems.org/gems/artii

	# Rubric requires that Udacity included code not be changed, so I commented it out
	# path = File.join(File.dirname(__FILE__), '../data/products.json')
	# file = File.read(path)
	# products_hash = JSON.parse(file)

def start
	setup
	print_report
end

def setup
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end

def section_break
	$report_file.puts "-" * 30
	$report_file.puts "*" *30
	$report_file.puts ""
end

# Print "Sales Report" in ascii art
# Print today's date
# Print "Products" in ascii art
# Print "Brands" in ascii art

def print_report
	ascii_art('Sales Report')
	todays_date
	ascii_art('Products')
	section_break
	products
	ascii_art('Brands')
	section_break
	brands
end


def ascii_art(art_title)
	a = Artii::Base.new #:font => 'slant'
	$report_file.puts a.asciify(art_title)
end

def todays_date
	$report_file.puts "Today's Date: " + Time.now.strftime("%m/%d/%Y")
end

# For each product in the data set:
def products
	$products_hash["items"].each do |toy| 
		toy_data(toy)
	end
end

def toy_data(toy)
	# Print the name of the toy
	$report_file.puts "Toy title: #{toy["title"]}"
	# Print the retail price of the toy
	$report_file.puts "Retail price: $#{toy["full-price"]}" 
	# Calculate and print the total number of purchases
	$report_file.puts "Total number of purchases: #{toy["purchases"].length}"
	# Calculate and print the total amount of sales 	
	$report_file.puts "Total sales: #{total_sales_toys(toy)}" 
	# Calculate and print the average price the toy sold for
	$report_file.puts "Average price: $#{avg_price(toy)}" 
	# Calculate and print the average discount (% or $) based off the average sales price
	$report_file.puts "Average discount: #{avg_discount(toy)}%" 
	section_break
end

def total_sales_toys(toy)
	total_sales = 0
	toy["purchases"].each { |purchase| total_sales = total_sales + purchase["price"]}
	return total_sales
end

def avg_price(toy)
	(total_sales_toys(toy)/ toy["purchases"].length).round(2)
end

def avg_discount(toy)
	((toy["full-price"].to_f - avg_price(toy).to_f ) / toy["full-price"].to_f).round(2) * 100
end

# For each brand in the data set:
def brands 
	unique_brands = $products_hash["items"].map { |item| item["brand"] }.uniq
	unique_brands.each_with_index do | brand, index |
		print_brands_data(brand)
		section_break
	end
end

def brand_items_info(brand)
	brands_items = $products_hash["items"].select { |item| item["brand"] == brand }
	return brands_items
end

def print_brands_data(brand)
	# Print the name of the brand
	$report_file.puts "Brand: #{brand}" 
	# Count and print the number of the brand's toys we stock
	total_stock_brand(brand)
	# Calculate and print the average price of the brand's toys
	brand_avg_price(brand)
	# Calculate and print the total sales volume of all the brand's toys combined
	brand_sales(brand)
end

# Calculate and print the total sales volume of all the brand's toys combined
def brand_sales(brand)	
	brand_sales = 0											
	brand_items_info(brand).each do |item|
		item["purchases"].each do |count|
	        brand_sales += count["price"].to_f
	    end
	end
	$report_file.puts "Total sales of #{brand}: $#{brand_sales.round(2)}"	# Calculate and print the total sales volume of all the brand's toys combined
end

# Calculate and print the average price of the brand's toys
def brand_avg_price(brand)	
	total_full_price_brand = 0																
	brand_items_info(brand).each do |toy|																	
		total_full_price_brand += toy["full-price"].to_f													
	end																	
	$report_file.puts "Average price of #{brand}: $#{(total_full_price_brand/brand_items_info(brand).length).round(2)}"	
end

# Count and print the number of the brand's toys we stock
def total_stock_brand(brand)	
	total_stock_brand = 0							
	brand_items_info(brand).each do |toy|		
		total_stock_brand += toy["stock"].to_i
	end								
	$report_file.puts "#{brand} on hand: #{total_stock_brand}"	
end

start

	

