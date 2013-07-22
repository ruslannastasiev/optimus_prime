require 'spec_helper'

describe Season do
  	
  	it { should have_many(:scores) }
  	it { should belong_to(:championship) }
  	
end
