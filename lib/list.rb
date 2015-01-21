class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list['name']
      id = list['id'].to_i()
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_singleton_method(:find) do |id|
    List.all().each() do |list|
      if list.id().==(id)
        @found_list = list
      end
    end
    @found_list
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first()['id'].to_i()
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name()).&self.id().==(another_list.id()).&self.due_date().==(another_list.due_date())
  end

  define_method(:tasks) do
    list_tasks = []
    tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
    tasks.each() do |task|
      description = task["description"]
      due_date = task["due_date"]
      list_id = task["list_id"].to_i()
      list_tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    list_tasks
  end

end
