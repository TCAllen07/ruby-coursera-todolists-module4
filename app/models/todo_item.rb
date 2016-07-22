# rails generate scaffold TodoItem due_date:date title:string description:text completed:boolean todo_list:references
# rails generate migration add_user_to_todo_items user:references
class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  default_scope { order due_date: :asc}
end
