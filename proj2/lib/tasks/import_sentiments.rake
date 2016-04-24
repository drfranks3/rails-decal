require 'csv'

desc "Import sentiments from csv file"
task :import_sentiments => [:environment] do

  file = "app/assets/sentiments.csv"

  CSV.foreach(file, :headers => false) do |row|
    Sentiment.create!(word: row[0], sentiment: row[1])
    puts "Created #{row[0]} -> #{row[1]}"
  end

end
