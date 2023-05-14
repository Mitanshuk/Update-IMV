require "csv"

module Seller
  def self.seeSellerData
    data = CSV.read("sellerdata.csv")
    data.each_with_index do |row, index|
      puts "#{index + 1} #{row}"
    end
    Choice.if2
  end

  def self.deleteSellerData
    data = CSV.read("sellerdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be deleted"
    choice = gets.chomp.to_i
    if (0...data.length).include?(choice)
      data.delete_at(choice)
      CSV.open("sellerdata.csv", "w") do |csv|
        data.each do |row|
          csv << row
        end
      end
      puts "Data has been deleted successfully."
    else
      puts "Invalid index. Please try again."
    end
    Choice.if2
  end

  def self.updateSellerData
    data = CSV.read("sellerdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be updated:"
    choice = gets.chomp.to_i
    puts "Enter updated name:"
    nm = gets.chomp
    puts "Enter updated password:"
    ps = gets.chomp
    puts "Enter updated location:"
    lc = gets.chomp
    puts "Enter updated email:"
    em = gets.chomp
    id = data[choice][0]
    seller_data = [id, nm, ps, lc, em]
    data[choice] = seller_data
    CSV.open("sellerdata.csv", "w") do |csv|
      data.each do |row|
        csv << row
      end
    end
    Choice.if2
  end

  def self.list_product
    data = CSV.read("product.csv")
    data.each_with_index do |row, index|
      puts "#{index + 1} #{row}"
    end
    Choice.if2
  end

  def self.delete_product
    data = CSV.read("product.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be deleted"
    choice = gets.chomp.to_i
    if (0...data.length).include?(choice)
      data.delete_at(choice)
      CSV.open("product.csv", "w") do |csv|
        data.each do |row|
          csv << row
        end
      end
      puts "Data has been deleted successfully."
    else
      puts "Invalid index. Please try again."
    end
    Choice.if2
  end

  def self.update_product
    data = CSV.read("product.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[1]} - #{row[2]} - #{row[3]} - #{row[4]}"
    end
    puts "Enter the index of the row to be updated:"
    choice = gets.chomp.to_i
    puts "Enter updated name:"
    name = gets.chomp
    puts "Enter updated price:"
    price = gets.chomp.to_i
    puts "Enter updated quantity:"
    quantity = gets.chomp.to_i
    puts "Enter updated seller id:"
    seller_id = gets.chomp.to_s
    product_data = [data[choice][0], name, price, quantity, seller_id]
    data[choice] = product_data
    CSV.open("product.csv", "w") do |csv|
      data.each do |row|
        csv << row
      end
    end
    Choice.if2
  end
  
end

module User
  def self.seeUserData
    data = CSV.read("userdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row}"
    end
    main
  end

  def self.deleteUserData
    data = CSV.read("userdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be deleted"
    choice = gets.chomp.to_i
    if (0...data.length).include?(choice)
      data.delete_at(choice)
      CSV.open("userdata.csv", "w") do |csv|
        data.each do |row|
          csv << row
        end
      end
      puts "Data has been deleted successfully."
    else
      puts "Invalid index. Please try again."
    end
    Choice.if1
  end

  def self.updateUserData()
    data = CSV.read("userdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be updated:"
    choice = gets.chomp.to_i
    puts "Enter updated name:"
    nm = gets.chomp
    puts "Enter updated password:"
    ps = gets.chomp
    puts "Enter updated location:"
    lc = gets.chomp
    puts "Enter updated email:"
    em = gets.chomp
    id = data[choice][0]
    user_data = [id, nm, ps, lc, em]
    data[choice] = user_data
    CSV.open("userdata.csv", "w") do |csv|
      data.each do |row|
        csv << row
      end
    end
    Choice.if1
  end
end

module Choice
  def self.if1
    puts "1 See user Detail"
    puts "2 Delete user Detail"
    puts "3 Update user Detail"
    puts "0 Main menu"
    choice = gets.chomp.to_i
    if choice == 1
      User.seeUserData
    elsif choice == 2
      User.deleteUserData
    elsif choice == 3
      User.updateUserData()
    elsif choice == 0
      main
    else
      puts "Invalid choice"
      main
    end
  end

  def self.if2
    puts "1 See seller data"
    puts "2 Delete seller data"
    puts "3 Update seller data"
    puts "4 List Products"
    puts "5 Delete Product"
    puts "6 Update product data"
    puts "0 Main menu"
    choice = gets.chomp.to_i
    if choice == 1
      Seller.seeSellerData
    elsif choice == 2
      Seller.deleteSellerData
    elsif choice == 3
      Seller.updateSellerData()
    elsif choice == 4
      Seller.list_product()
    elsif choice == 5
      Seller.delete_product()
    elsif choice == 6
      Seller.update_product()
    elsif choice == 0
      main
    else
      puts "Invalid choice"
      main
    end
  end
  
end

