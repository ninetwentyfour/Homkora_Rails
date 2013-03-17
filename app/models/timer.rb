class Timer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  include Tanker
  
  field :time, type: String, default: "00:00:00"
  field :title, type: String
  field :description, type: String
  
  belongs_to :project
  
  validates_presence_of :title, :description
  
  # define the callbacks to update or delete the index
  after_save :update_tank_indexes, :unless => Proc.new{ Rails.env.test? }
  after_destroy :delete_tank_indexes, :unless => Proc.new{ Rails.env.test? }
  
  after_save :update_project_time
  
  attr_accessible :title, :description, :time, :project_id
  
  # Update the projects total_time
  def update_project_time
    self.project.update_project_time
  end
  
  # ===============
  # = CSV support =
  # ===============
  comma do
    title
    description
    time
    project :title => 'Project Title'
    project_id
  end
  
  # define the index by supplying the index name and the fields to index
  # this is the index name you create in the Index Tank dashboard
  # you can use the same index for various models Tanker can handle
  # indexing searching on different models with a single Index Tank index
  tankit 'homkora_rails_timers' do

    indexes :title
    indexes :description
    indexes :id
    indexes :time
    indexes :project_id
    
    functions do
      {
        1 => '-age',
        2 => 'relevance'
      }
    end
  end
end
