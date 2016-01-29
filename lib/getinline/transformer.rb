require 'premailer'

TOKEN = '@TOKEN'
ERB_TAG = /<%.+?%>/
TOKENIZED_ERB_FILE_NAME = '/tmp/tokenized.erb'

module Getinline
  class Transformer
    def initialize(raw_text, options = {})
      @raw_text = raw_text
      @options = default_options.merge(options)
    end

    def default_options
      @default_options ||= {
        mode: :html,
        base_url: nil,
        link_query_string: nil,
        remove_classes: false,
        verbose: false,
        line_length: 9001,
        output_encoding: 'US-ASCII',
        warn_level: Premailer::Warnings::SAFE
      }
    end

    def transform
      matches = @raw_text.scan(ERB_TAG)
      tokenized_text = @raw_text.dup
      matches.each do |match|
        tokenized_text.sub!(match, TOKEN)
      end

      File.write(TOKENIZED_ERB_FILE_NAME, tokenized_text)

      @premailer = Premailer.new(TOKENIZED_ERB_FILE_NAME, @options)
      premailed_tokenized_text = @options[:mode] == :txt ?
        @premailer.to_plain_text : @premailer.to_inline_css
      premailed_text = premailed_tokenized_text.dup

      matches.each do |match|
        premailed_text.sub!(TOKEN, match)
      end

      premailed_text
    end
  end
end