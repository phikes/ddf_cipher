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
  end
end
