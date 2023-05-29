#!/usr/bin/env ruby

require "eon"
require "thor"

module Eon
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc "generate", "Creats a new AES Key"
    def generate
      Eon.generate
    end

    desc "encrypt", "Encrypts with an eon_aes.key"
    def encrypt(target, destination)
      Eon.encrypt_file(target, destination)
    end

    desc "decrypt", "Decrypts with an eon_aes.key"
    def decrypt(target, destination)
      Eon.decrypt_file(target, destination)
    end
  end
end
