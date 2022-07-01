class Array
    def sales_tax
        product_name=self[0]
        imported=self[1]
        exempted_from_tax=self[2]
        price=self[3].to_f
        tax = 0.0
        import_tax=0.05
        sale_tax=0.1
        tax += (price*import_tax) if imported == 'yes'
        tax += (price*sale_tax) unless exempted_from_tax == 'yes'
        [product_name.ljust(15), price.to_s.ljust(15) , tax.to_s.ljust(15), (price+tax).to_s.ljust(15)]
    end

    def display_list
        p 'Product_Name   Price          Tax            Total_Price    '
        each do |array|
            p array.join
        end
    end
end

total_entry = Array.new(Array.new)
loop do
    puts 'Name of the product: '
    product_name = gets.chomp
    puts 'Imported?: '
    imported = gets.chomp
    puts 'Exempted from sales tax? '
    exempted_from_tax = gets.chomp
    puts 'Price: '
    price = gets.chomp
    total_entry.push([product_name,imported,exempted_from_tax,price])
    puts 'Do you want to add more items to your list(y/n): '
    response = gets.chomp
    break if response == 'n'
end
# puts total_entry
result = Array.new(Array.new)
total_entry.each do |array|
    result.push(array.sales_tax)
end
result.display_list