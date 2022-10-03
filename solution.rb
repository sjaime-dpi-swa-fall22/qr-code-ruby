require "rqrcode"

kind_of_code = 1

while kind_of_code != 4

  puts "What kind of QR code would you like to generate?"
  puts
  puts "1. Open a URL"
  puts "2. Join a wifi network"
  puts "3. Send a text message"
  puts "4. Exit program"
  puts

  kind_of_code = gets.to_i
  puts

  if kind_of_code == 4
    break
  elsif kind_of_code == 1
    puts "What is the URL you would like to encode?"
    puts
    
    text_to_encode = gets.chomp
    puts
  elsif kind_of_code == 2
    puts "What is the name of the wifi network?"
    puts

    network_name = gets.chomp
    puts

    puts "What is the password?"
    puts

    network_password = gets.chomp
    puts

    text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"
  elsif kind_of_code == 3
    puts "What is the phone number you want the code to send a text message to?"
    puts

    phone_number = gets.chomp
    puts

    puts "What do you want to populate the message with?"
    puts

    message_body = gets.chomp
    puts

    text_to_encode = "SMSTO:#{phone_number}:#{message_body}"
  else
    puts "Didn't recognize that selection. Please try again."
    puts

    next
  end

  puts "What would you like to call the PNG?"
  puts

  filename = gets.chomp

  qrcode = RQRCode::QRCode.new(text_to_encode)

  png = qrcode.as_png({ :size => 500 })

  IO.binwrite("#{filename}.png", png.to_s)
end
