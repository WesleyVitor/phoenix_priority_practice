defmodule ToDoList.Board.Task do
  use Ecto.Schema

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, :date
    field :status, Ecto.Enum, values: [:pending, :in_progress, :done]

    timestamps()
  end
end
