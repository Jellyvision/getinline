require 'premailer'
require 'nokogiri'

TOKEN = '@TOKEN'
TOKENIZED_ERB_FILE_NAME = '/tmp/tokenized.erb'

module Getinline
  class Transformer
    def initialize(raw_text, options = {}, premailer_options = {})
      @raw_text = raw_text
      @options = options
      @premailer_options = premailer_options
    end

    def transform
      matches = @raw_text.scan(/<%.+?%>/)
      tokenized_text = @raw_text.dup
      matches.each do |match|
        tokenized_text.sub!(match, TOKEN)
      end

      File.write(TOKENIZED_ERB_FILE_NAME, tokenized_text)

      @premailer = Premailer.new(TOKENIZED_ERB_FILE_NAME, @premailer_options)
      premailed_tokenized_text = @options[:mode] == :txt ?
        @premailer.to_plain_text : @premailer.to_inline_css
      premailed_text = Nokogiri::HTML(premailed_tokenized_text.dup).to_html(encoding:'US-ASCII')

      matches.each do |match|
        premailed_text.sub!(TOKEN, match)
      end

      premailed_text
    end
  end
end