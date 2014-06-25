
require 'csv'

# 共通
def import_tsv(file_name, class_name)
  puts "import #{class_name}"
  quote_chars = %w(" | ~ ^ & *)
  begin
    class_name.delete_all
    CSV.foreach(file_name, col_sep: "\t", quote_char: quote_chars.shift) do |row|
      record = class_name.new
      record.attributes.keys.each do |key|
        record[key] = "#{row.shift}"
      end
      record.save!
    end
  rescue CSV::MalformedCSVError
    quote_chars.empty? ? raise : retry
  end
end
