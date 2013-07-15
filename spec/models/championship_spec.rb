require 'spec_helper'

describe Championship do  

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should ensure_length_of(:name).is_at_most(100) }
  it { should belong_to(:user) }
  it { should have_many(:teams) }
    
end