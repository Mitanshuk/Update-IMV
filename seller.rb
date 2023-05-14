module Product
  def self.seeProduct
    data = CSV.read("product.csv")
    login = CSV.read("loginData.csv")
    found_data = false
    data.each do |row|
      if row.last == login.first[0][0]
        puts "#{row[0]}, #{row[1]}, #{row[3]}, #{row[2]}, #{row[4]}"
        found_data = true
      end
    end
    puts "Data not exist" unless found_data
    productOperation(data[0])
  end

  def self.addProduct
    puts "Enter Product Name"
    pname = gets.chomp
    puts "Enter Quantity"
    pqty = gets.chomp.to_i
    puts "Enter Price/Piece"
    price = gets.chomp.to_i
    data = CSV.read('loginData.csv')
    login = data.first[0][0]
    t = Time.now.usec
    pid = "product" + t.to_s
    product_data = [pid, pname, pqty, price, login]
    CSV.open('product.csv', 'a') do |csv|
      csv << product_data
    end
    productOperation(data[0])
  end

  def self.productOperation(*row)
    login = row.first[0][0]
    CSV.open("loginData.csv", "a") do |csv|
      csv << [login]
    end
    puts "1 See Stock"
    puts "2 Add Product"
    puts "3 Update Product"
    puts "4 Delete Product"
    puts "5 Logout"
    choice = gets.chomp.to_i
    if choice == 1
      seeProduct
    elsif choice == 2
      addProduct
    elsif choice == 3
      updateProduct
    elsif choice == 4
      deleteProduct
    elsif choice == 5
      File.open("loginData.csv", "w") do |file|
        main
      end
    else
      # next
    end
  end

  def self.updateProduct
    data = CSV.read("product.csv")
    login = CSV.read("loginData.csv")
    num = 0
    temp = []
    data.each do |row|
      if row.last == login.first[0][0]
        puts "#{num} #{row}"
        num += 1
        temp.push(row.first)
      end
    end
    puts "#{temp}"
    puts "Enter the a number where's product want to update:"
    choice = gets.chomp.to_i
    puts "Enter updated Product name:"
    pnm = gets.chomp
    puts "Enter updated Quantity:"
    pqt = gets.chomp.to_i
    puts "Enter updated Price:"
    pr = gets.chomp.to_i

    id = temp[choice]
    product_index = data.index { |row| row[0] == id }
    if product_index
      product_data = [id, pnm, pqt, pr, login.first[0][0]]
      data[product_index] = product_data
      CSV.open("product.csv", "w") do |csv|
        data.each do |row|
          csv << row
        end
      end
      Product.productOperation(login.first[0])
    else
      puts "Invalid Id"
    end
  end

  def self.deleteProduct
    data = CSV.read("product.csv")
    login = CSV.read("loginData.csv")
    num = 0
    temp = []
    data.each do |row|
      if row.last == login.first[0]
        puts "#{num} #{row}"
        num += 1
        temp.push(row.first)
      end
    end
    # puts "#{temp}"
    puts "Enter the number of the product you want to delete:"
    choice = gets.chomp.to_i

    id = temp[choice]
    product_index = data.index { |row| row[0] == id }
    if product_index
      data.delete_at(product_index)
      CSV.open("product.csv", "w") do |csv|
        data.each do |row|
          csv << row
        end
      end
      Product.productOperation(login.first[0])
    else
      puts "Invalid Id"
    end
  end

end