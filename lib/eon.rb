# frozen_string_literal: true

require_relative "eon/version"
require "openssl"
require "base64"

module Eon
  def self.encrypt_file(target, destination)
    encoded_key = IO.read("eon_aes.key")
    cipher = OpenSSL::Cipher.new("aes-256-cbc")
    cipher.encrypt
    cipher.key = Base64.decode64(encoded_key)
    data = IO.read(target)
    encrypted = cipher.update(data)
    encrypted << cipher.final
    IO.write(destination, Base64.encode64(encrypted))
    puts "Successfully encrypted #{target} here: #{destination}"
  rescue StandardError
    puts "Error encountered"
  end

  def self.decrypt_file(target, destination)
    encoded_key = IO.read("eon_aes.key")
    cipher = OpenSSL::Cipher.new("aes-256-cbc")
    cipher.decrypt
    cipher.key = Base64.decode64(encoded_key)
    data = IO.read(target)
    data = Base64.decode64(data)
    decrypted = cipher.update(data)
    decrypted << cipher.final
    IO.write(destination, decrypted)
    puts "Successfully decrypted #{target} here: #{destination}"
  rescue StandardError
    puts "Error encountered"
  end

  def self.generate
    cypher = OpenSSL::Cipher.new("aes-256-cbc")
    cypher.encrypt
    key = Base64.encode64(cypher.random_key)
    IO.write("eon_aes.key", key)
    puts "Success"
  end
end
