require 'spec_helper'

module DdfCipher
  describe Cipher do
    context 'upon initialization' do
      it 'has an initializer which takes one argument' do
        expect(Cipher).to respond_to(:new).with(1).argument
      end
    end

    context 'upon encryption' do
      let(:lowercase_string) { 'abc' }
      let(:mixcase_string) { 'abcABC' }
      let(:strange_string) { 'abc !23' }

      it 'encrypts a lowercase string correctly' do
        cipher = Cipher.new lowercase_string
        expect(cipher.encrypt).to eq ':-):-));-)'
      end

      it 'encrypts a mixcase string correctly' do
        cipher = Cipher.new mixcase_string
        expect(cipher.encrypt).to eq ':-):-));-):-):-));-)'
      end

      it 'keeps characters which can not be encrypted' do
        cipher = Cipher.new strange_string
        expect(cipher.encrypt).to eq ':-):-));-) !23'
      end
    end

    context 'upon decryption' do
      let(:replacable_string) { ':-):-));-)' }

      it 'correctly decodes a string composed of replacable substrings' do
        cipher = Cipher.new replacable_string
        expect(cipher.decrypt).to eq 'abc'
      end
    end
  end
end