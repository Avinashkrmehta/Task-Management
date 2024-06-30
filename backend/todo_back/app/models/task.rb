class Task < ApplicationRecord
  belongs_to :user
  enum status: { todo: 'To Do', in_progress: 'In Progess', done: 'Done'}
end
