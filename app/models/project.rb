class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :total_time, type: String, default: "00:00:00"
  field :description, type: String
  
  belongs_to :user
  
  has_many :timers, :dependent => :destroy
  
  validates_presence_of :title, :description
  
  def update_project_time
    unless self.timers.blank?
      total_time = self.timers.first.time
      self.timers.each_with_index do |timer, index|
        unless index == 0
          total_time = add_time_together(total_time,timer.time)
        end
      end
    else
      total_time = "00:00:00"
    end
    self.total_time = total_time
    self.save
  end
  
  
  def add_time_together(time,addtime)
    time = time.chomp.split(':')
    addtime = addtime.chomp.split(':')
    min_in_sec = (time[2].to_i+addtime[2].to_i) / 60
    cur_sec = (time[2].to_i+addtime[2].to_i) % 60
    hor_in_min = (time[1].to_i+addtime[1].to_i+min_in_sec) / 60
    cur_min = (time[1].to_i+addtime[1].to_i+min_in_sec) % 60
    cur_hor = (time[0].to_i+addtime[0].to_i+hor_in_min) % 12
    # if cur_hor==0 
    #   cur_hor=12
    # end
    "#{cur_hor.to_s.rjust(2, '0')}:#{cur_min.to_s.rjust(2, '0')}:#{cur_sec.to_s.rjust(2, '0')}"
  end
  
  # ===============
  # = CSV support =
  # ===============
  comma do
    title
    description
    total_time
    timers :size => 'Timers'
  end
  
end
