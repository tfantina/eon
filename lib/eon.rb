
require_relative "eon/version"
require 'openssl'
require 'base64'

module Eon
  def self.encrypt_file(target, destination)
    begin 
      encoded_key = IO.read("eon_aes.key")
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = Base64.decode64(encoded_key)
      data = IO.read(target)
      encrypted = cipher.update(data)
      encrypted << cipher.final
      IO.write(destination, Base64.encode64(encrypted))
      puts "Successfully encrypted #{target} here: #{destination}"
    rescue 
      puts "Error encountered"
    end 
  end 

  def self.decrypt_file(target, destination)
    begin 
      encoded_key = IO.read("eon_aes.key")
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.decrypt 
      cipher.key = Base64.decode64(encoded_key)
      data = IO.read(target)
      data = Base64.decode64(data)
      decrypted = cipher.update(data)
      decrypted << cipher.final
      IO.write(destination, decrypted) 
      puts "Successfully decrypted #{target} here: #{destination}"
    rescue 
      puts "Error encountered"
    end 
  end 

  def self.generate() 
    cypher = OpenSSL::Cipher::AES256.new(:CBC)
    cypher.encrypt 
    key = Base64.encode64(cypher.random_key)
    IO.write('eon_aes.key', key)
  end 
end
