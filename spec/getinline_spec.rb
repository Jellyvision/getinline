require 'spec_helper'

describe Getinline do
  it 'has a version number' do
    expect(Getinline::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(Getinline::Transformer).to be_a(Class)
  end
end
