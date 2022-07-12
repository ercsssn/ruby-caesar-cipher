#My Solution
def caesar_cipher(string, digit)
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

    string.split("").each do |letter| 
        if upper_case_hash.key?(letter)
            current_pos = upper_case_hash["#{letter}"]
            new_pos = current_pos + digit
            if new_pos > 25
                wrap_pos = (new_pos - 25) - 1
                encrypted_string += upper_case_hash.key(wrap_pos)
            else
                encrypted_string += upper_case_hash.key(new_pos)
            end
        elsif lower_case_hash.key?(letter)
            current_pos = lower_case_hash["#{letter}"]
            new_pos = current_pos + digit
            if new_pos > 25
                wrap_pos = (new_pos - 25) - 1
                encrypted_string += lower_case_hash.key(wrap_pos)
            else
                encrypted_string += lower_case_hash.key(new_pos) 
            end
        else
            encrypted_string += letter
        end
    end

    return encrypted_string

end

#TOP 1
class CaesarCipher
    def translate(message, shift, result = '')
      message.each_char do |char|
        base = char.ord < 91 ? 65 : 97
        # Modifies Lowercase & Uppercase
        if char.ord.between?(65, 90) || char.ord.between?(97, 122)
          rotation = (((char.ord - base) + shift) % 26) + base
          result += rotation.chr
        # Keeps spaces & punctuation
        else
          result += char
        end
      end
      result
    end
  end

#TOP 2
  def caesar_cipher(text, shift)
    for i in 0...text.length do
      char_code = text[i].ord
      
      (a, z) = case char_code
               when 97..122 then [97, 122]   # a-z
               when 65..90  then [65, 90]    # A-Z
               else next
      end
  
      rotate = shift > 0 ? 26 : -26
  
      char_code += shift
      char_code -= rotate unless char_code.between?(a, z)
  
      text[i] = char_code.chr
    end
  end
  
  message = "Omae wa mou shindeiru. -NANI!?!!"
  
  caesar_cipher(message, 21)
  
  puts message

  #TOP 3
  def caesar_cipher(string,shift_factor)

    # Split string into character array, get ascii value for each character 
    # 65 - 90 for A-B
    # 97 - 122 for a-b
    asciis = string.split("").map { |e| e.ord }

    shifted = asciis.map do |ascii|
        # check if character is aplhabetic, yes - do shift , no - no shift
        if ascii.between?(65,90)
            # logic for wrap around
            if shift_factor.positive?
                ascii + shift_factor > 90 ? (ascii + shift_factor) - 26 : ascii + shift_factor
            else
                ascii + shift_factor < 65 ? (ascii + shift_factor) + 26 : ascii + shift_factor
            end
        elsif ascii.between?(97,122)
            if shift_factor.positive?
                ascii + shift_factor > 122 ? (ascii + shift_factor) - 26 : ascii + shift_factor
            else
                ascii + shift_factor < 97 ? (ascii + shift_factor) + 26 : ascii + shift_factor
            end
        else
            ascii
        end
    end

    shifted_string = shifted.map! { |a| a.chr }.join
    p shifted_string
end

print "Enter the string to encode : "
string = gets.chomp

print "Enter the shift factor for the string : "
shift_factor = gets.chomp.to_i

caesar_cipher(string,shift_factor)