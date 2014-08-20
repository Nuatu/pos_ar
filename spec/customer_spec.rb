require 'spec_helper'

describe Customer do
  it { should have_many :purchases}
  it { should have_many :returns }
end
