require 'spec_helper'

describe Page do 

   it { should have_many(:widgets) }
   it { should validate_presence_of(:content) }
   it { should validate_presence_of(:link) }
   it { should validate_presence_of(:name) }
   it { should ensure_length_of(:name).is_at_most(30) }
   it { should ensure_length_of(:link).is_at_most(30) }
   it { should validate_uniqueness_of(:link) }
  
end