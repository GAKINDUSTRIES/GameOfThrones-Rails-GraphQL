# rubocop:disable all
require "#{Rails.root}/app/services/api_service"

task download_data: :environment do
  puts "You're about to download all the GOT data: \n"
  puts "Are you sure you want to proceed? (type y/n)"
  if STDIN.gets.strip == 'y'
    puts "\n Downloading books... \n"
    ApiService.download_books
    puts "\n Downloading houses... \n"
    ApiService.download_houses
    puts "\n Downloading characters... \n"
    ApiService.download_characters
    print "\n \n All data was successfully processed"
  else
    print 'No modifications were made'
  end
end
