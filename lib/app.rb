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
#  	$products_hash["items"].each do |toy|
#  		return toy["title"]
#  		return "Retail Price: $" + toy["full-price"]
#  		return "Total Number of Purchases: " + toy["purchases"].length.to_s
#  		total_sales = 0.0
#  		toy["purchases"].each do |purchase| 
#  			total_sales += purchase["price"].to_f
#  		end
#  		return "Total_sales: $#{total_sales}"
#  		avg_price = total_sales/toy["purchases"].length
#  		return "Average Price: $#{avg_price}"
#  		avg_discount = ((toy["full-price"].to_f - avg_price.to_f) / toy["full-price"].to_f) * 100
#  		return "Average Discount: #{avg_discount.round(2)}%"
#  	end
# end


def toy_price(toy)
	retail_price = toy["full-price"].to_f
	puts "Retail Price : $#{retail_price}"
end

def total_purchases(toy)
	total_purchases = toy["purchases"].length.to_s
	puts "Total Number of Purchases: #{total_purchases}"
end

def total_amount_sales(toy)
	total_sales = toy["purchases"].inject do |sum, purchase|
		sum + purchase["price"]
	end
	puts "Total sales: $#{total_sales}"
end

def calculate_avg_product_price
	avg_price = total_amount_sales(toy)/total_purchases(toy)
	puts "Average Price: $#{avg_price}"
end

def calculate_avg_discount(toy)
	avg_discount = ((toy["full-price"].to_f - calculate_avg_product_price.to_f) / toy["full-price"].to_f) * 100
	puts "Average Discount: #{avg_discount.round(2)}%"
end

def toy_info_printout
	$products_hash["items"].each do |toy|
		puts {toy["title"]}
		toy_price(toy)
		total_purchases(toy)
		total_amount_sales(toy)
		calculate_avg_product_price(toy)
		calculate_avg_discount(toy)
		end
end

def brands_section
	$brands = []
	$products_hash["items"].each do |toy|
		$brands.push(toy["brand"]) unless $brands.include?(toy["brand"])
	end
end

def brand_total_stock(toy)
	total_stock = $branded_products.inject(0) do |sum, toy|
		sum + toy["stock"]
	end
end

def brand_avg_price(toy)
	$total_retail_price = $branded_products.inject(0) do |sum, toy|
		sum + toy["full-price"].to_f
	end
end

def total_sales_brand(toy)
	toy["purchases"].each do |toy|
		$total_sales = $total_sales + toy["price"]
	end
end


# Print "Sales Report" in ascii art
	ascii_art('Sales Report')

	section_break

# Print today's date
	todays_date

# Print "Products" in ascii art
	ascii_art('Products')

	section_break

	toy_info_printout
	#total_purchases("LEGO Iron Man vs. Ultron")
	#total_amount_sales("LEGO Iron Man vs. Ultron")
	#calculate_avg_product_price("LEGO Iron Man vs. Ultron")
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
