require 'csv'

class CopyCsvToText
    def csv_to_text_file
        csv_content = CSV.read('./23_CSV.csv',converters: lambda { |value| value.strip })
        csv_content = csv_content[1..]
        csv_hash = csv_content.group_by { |csv_row| csv_row[2] }
        new_file = File.new('./23_text.txt',"w")
        begin
            csv_hash.each do |key,value|
                new_file.write("\n#{key}#{'s' if value.length>1}\n")
                value.each do |details|
                    new_file.write("#{details[0]} (EmpId: #{details[1]})\n")
                end
            end
        rescue
            error = "Error Occured"
        else
            error = "No Error Occured"
        end
        new_file.close
        error
    end
end

puts CopyCsvToText.new.csv_to_text_file