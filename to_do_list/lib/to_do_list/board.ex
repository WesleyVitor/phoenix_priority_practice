defmodule ToDoList.Board do

  alias ToDoList.Board.Task
  alias ToDoList.Repo
  def list_all_tasks do
    Repo.all(Task)
  end

  def create_new_task(attrs) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def get_task_by_id(id) do
    Task |> Repo.get(id)
  end

  def create_change() do
    %Task{}
  end

  def create_change_to_update(id) do
    task = get_task_by_id(id)
    case task do
      nil -> nil
      _ -> Ecto.Changeset.change(task)
    end
  end


  def update_task(id, attrs) do
    task = get_task_by_id(id)
    case task do
      nil -> nil
      _ -> update_task_changeset(task, attrs)
    end
  end

  defp update_task_changeset(task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end
end
