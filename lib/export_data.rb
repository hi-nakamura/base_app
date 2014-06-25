
require 'csv'

# 共通
def export_tsv(file_name, class_name)
  puts "export #{class_name}"

  File.open(file_name, 'w') do |file|
    records = class_name.all
    records.each do |record|
      file.puts record.attributes.values.join("\t")
    end
  end
end
