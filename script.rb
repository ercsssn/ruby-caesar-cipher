def caesar_cipher(string)
    upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
    lower_case = "abcdefghijklmnopqrstuvwxyz".split("")
    upper_case_hash = Hash.new
    lower_case_hash = Hash.new
    encrypted_string = ""

    lower_case.each_with_index do |letter,index|
        lower_case_hash[letter] = index
    end

    upper_case.each_with_index do |letter,index|
        upper_case_hash[letter] = index
    end

    upper_case_hash.each do |letter,position|
        puts "#{letter} = #{position}"
    end


    # string.split("").each do |letter| 
    #     if upper_case.include?(letter)
    #         puts "I'm uppercase"
    #     elsif lower_case.include?(letter)
    #         puts "I'm lowercase"
    #     else
    #         puts "I'm a special character or a number"
    #     end
    # end

end