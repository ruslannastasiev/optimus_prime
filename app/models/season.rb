class Season < ActiveRecord::Base

  attr_accessible :start_date, :description, :championship_id
  has_many :scores
  belongs_to :championship

  def start_season
    
    c = self.championship.teams          
    a = []
    z = 1         
    self.championship.teams.each do |team|
      a << team.id
    end

    if a.count % 2 != 0
      self.championship.teams.create! name: "no oponent"
      a << self.championship.teams.last.id
    end       
    
    left_array = a.first(a.count/2) 
    right_array = a.drop(a.count/2)
    right_array.reverse!
    x = left_array + right_array

    i = 0  
    (1..x.count/2).each do |xx| 
      self.scores.create! team1_id: left_array[i], team2_id: right_array[i], round: z
      i += 1
    end 

    i = 0
    (1..x.count/2).each do |xx| 
      self.scores.create! team1_id: right_array[i], team2_id: left_array[i], round: (z + x.count - 1)
      i += 1
    end     

    (1..(x.count-2)).each do |t|

      first_team = left_array[0]      
      left_buffer = left_array.drop(1)
      i = 0
      right_array.unshift(left_buffer.first)
      left_buffer.push(right_array.last)
      right_array.pop
      left_buffer.shift
      left_buffer.unshift(first_team)      
      left_array = left_buffer
      z += 1

      (1..x.count/2).each do |m|      
        self.scores.create! team1_id: left_array[i], team2_id: right_array[i], round: z
        self.scores.create! team1_id: right_array[i], team2_id: left_array[i], round: (z + x.count - 1)
        i += 1
      end

    end

  end

end