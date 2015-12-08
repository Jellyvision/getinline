require "getinline/version"
require "premailer"

TOKEN = "@TOKEN"
TOKENIZED_ERB_FILE_NAME = "/tmp/tokenized.erb"

module Getinline
  class Transformer
    def initialize (file_name)
      @file_name = file_name
    end

    def transform
      file = File.open(@file_name, "r")
      raw_text = file.read
      file.close

      matches = raw_text.scan(/<%.+?%>/)
      tokenized_text = raw_text.dup
      matches.each do |match|
        tokenized_text.sub!(match, TOKEN)
      end

      File.write(TOKENIZED_ERB_FILE_NAME, tokenized_text)

      @premailer = Premailer.new(TOKENIZED_ERB_FILE_NAME, :warn_level => Premailer::Warnings::SAFE)
      premailed_tokenized_text = @premailer.to_inline_css
      premailed_text = premailed_tokenized_text.dup

      matches.each do |match|
        premailed_text.sub!(TOKEN, match)
      end

      premailed_text
    end
  end
end
