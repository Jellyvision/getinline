require 'spec_helper'

describe Getinline do
  it 'has a version number' do
    expect(Getinline::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(Getinline::Transformer).to be_a(Class)
  end

  context '#transform' do
    context 'no erb tags' do
      raw_basic = File.read('spec/fixtures/raw/basic.erb')
      inlined_basic = File.read('spec/fixtures/inlined/basic.erb')

      transformer = Getinline::Transformer.new(raw_basic)
      transformed_text = transformer.transform

      it 'renders inlined html' do
        expect(transformed_text).to include(inlined_basic)
      end
    end

    context 'with erb tags' do
      raw_with_tags = File.read('spec/fixtures/raw/with-tags.erb')
      inlined_with_tags = File.read('spec/fixtures/inlined/with-tags.erb')

      transformer = Getinline::Transformer.new(raw_with_tags)
      transformed_text = transformer.transform

      it 'renders inlined html' do
        expect(transformed_text).to include(inlined_with_tags)
      end
    end
  end
end
