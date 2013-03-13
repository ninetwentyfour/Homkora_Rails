class Timer
  include Mongoid::Document
  include Mongoid::Timestamps
  field :time, type: String, default: "00:00:00"
  field :title, type: String
  field :description, type: String
  
  belongs_to :project
  
  validates_presence_of :title, :description
  
  after_save :update_project_time
  
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
end
