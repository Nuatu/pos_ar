require 'spec_helper'

describe Product do
  it { should have_many :purchases }
  it { should have_many :returns }
end
