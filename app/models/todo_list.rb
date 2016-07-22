# rails generate scaffold TodoList list_name:string list_due_date:date
# rails generate migration add_user_to_todo_lists user:references
class TodoList < ActiveRecord::Base
  belongs_to(:user)
  has_many(:todo_items, dependent: :destroy)
  default_scope { order list_due_date: :asc}
end
