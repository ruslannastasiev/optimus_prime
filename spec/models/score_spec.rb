require 'spec_helper'

describe Score do

  it { should belong_to(:team1) }
  it { should belong_to(:team2) }
  
end