# rails generate scaffold User username:string password_digest:string
class User < ActiveRecord::Base
  has_secure_password
  has_one(:profile, dependent: :destroy)
  has_many(:todo_lists, dependent: :destroy)
  has_many(:todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy)

  validates(:username, presence: true)

  def get_completed_count()
    completes = 0
    mylists = TodoList.where(user:self)
    # if mylists.length == 1
    #   mylists = [mylists,]
    # end
    mylists.each do  |list|
      items = TodoItem.where(todo_list:list, completed:true)
      completes += items.length()
    end
    return completes
  end
end
