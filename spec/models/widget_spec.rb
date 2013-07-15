require 'spec_helper'

describe Widget do 

  it { should belong_to(:page) }
  it { should ensure_length_of(:name).is_at_most(30) }
  it { should validate_presence_of(:name) }  
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:page) } 
  it { should validate_uniqueness_of(:name) }

end