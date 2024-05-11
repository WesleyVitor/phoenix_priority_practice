defmodule ToDoListWeb.TaskController do
  use ToDoListWeb, :controller

  alias ToDoList.Board
  def index(conn, _params) do
    tasks = Board.list_all_tasks()
    render(conn, :index, tasks: tasks)
  end

  def show(conn, %{"id"=> id}) do
    task = Board.get_task_by_id(id)
    render(conn, :show, task: task)
  end
end
