Canard::Abilities.for(:user) do
  
  can :read, Project, user: { _id: user._id }
  can :create, Project
  can :update, Project, user: { _id: user._id }
  can :destroy, Project, user: { _id: user._id }
  
  can :read, Timer, project: { user: { _id: user._id } }
  can :create, Timer
  can :update, Timer, project: { user: { _id: user._id } }
  can :destroy, Timer, project: { user: { _id: user._id } }
  
  can :read, User, :_id => user._id
  can :update, User, :_id => user._id
end