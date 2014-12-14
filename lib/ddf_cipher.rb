require "ddf_cipher/version"
require 'replacements'

module DdfCipher
  class Cipher
    def initialize(str)
      @str = str
    end

    def encrypt
      @str.each_char.inject '' do |ak, char|
        ak << (Replacements[char.downcase.to_sym] || char)
      end
    end

    def decrypt
      result = @str

      sorted_replacements.each do |char, repl|
        result.gsub! repl, char.to_s
      end

      result
    end

    private
    def sorted_replacements # this helps, because the cipher is not
                            # prefix free (a is ':-)' and b is ':-))')
      Replacements.sort {|a,b| b[1].length <=> a[1].length }
    end
  end
end
