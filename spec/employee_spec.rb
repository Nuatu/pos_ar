require 'spec_helper'

describe Employee do
  it { should have_many :purchases }
  it { should have_many :returns }
end
