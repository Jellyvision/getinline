require "getinline/version"
require "premailer"

module Getinline
  class Transformer
    def initialize (file_name)
      @file_name = file_name
      @premailer = Premailer.new(@file_name, :warn_level => Premailer::Warnings::SAFE)
    end

    # FIXME: Implement this method
    def transform
      @premailer.to_inline_css
    end
  end
end
