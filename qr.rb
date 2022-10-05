require "rqrcode"

# Use the RQRCode::QRCode class to encode some text
# qrcode = RQRCode::QRCode.new("wikipedia qr code") # creates a qr code that lands on a google search page for "wikipedia qr code"

selection = 0

while selection != "4"

  puts "What kind of QR code would you like to generate?"
  puts
  puts "1. Open a URL"
  puts "2. Join a wifi network"
  puts "3. Send a text message"
  puts "4. Exit program"

  selection = gets.chomp

  if selection == "1"
    puts "What is the URL you would like to encode?"
    url = gets.chomp
    qrcode = RQRCode::QRCode.new(url) 

  elsif selection == "2"
    puts "What is the name of the wifi network?"
    wifi = gets.chomp
    puts "What is the password?"
    pwd = gets.chomp
    qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi};P:#{pwd};;") 

  elsif selection == "3"
    puts "What is the phone number you want the code to send a text message to?"
    phone = gets.chomp
    puts "What do you want to populate the message with?"
    msg = gets.chomp
    qrcode = RQRCode::QRCode.new("SMSTO:+#{phone}:#{msg}") 

  elsif selection != "4"
    puts "Didn't recognize that selection. Please try again."
  end
  
  if selection == "1" || selection == "2" || selection == "3"
    puts "What would you like to call the PNG?"
    file_name=gets.chomp

    png = qrcode.as_png({ :size => 500 })
    # Write the image data to a file, "sometext.png"
    IO.binwrite(file_name+".png", png.to_s)
  end
end
