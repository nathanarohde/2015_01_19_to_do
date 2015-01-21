class Task
  attr_reader(:description, :due_date, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @due_date = attributes[:due_date]
    @list_id = attributes[:list_id]
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task["description"]
      list_id = task["list_id"].to_i()
      due_date = task["due_date"]
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    tasks
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()) && self.due_date().==(another_task.due_date()) && self.list_id().==(another_task.list_id())
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, due_date, list_id) VALUES ('#{@description}', '#{@due_date}', #{@list_id})")
  end


end
