defmodule ToDoList.Board.Task do
  use Ecto.Schema
  import Ecto.Changeset
  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, :date
    field :status, Ecto.Enum, values: [:pending, :in_progress, :done], default: :pending

    timestamps()
  end

  defp validate_due_date(:due_date, due_date) do
    if due_date < Date.utc_today() do
      [:error, "Due date must be in the future"]
    else
      []
    end
  end

  def changeset(task \\ %__MODULE__{}, attrs) do
    task
      |> cast(attrs, [:title, :description, :due_date, :status])
      |> validate_required([:title, :description, :due_date, :status])
      |> validate_inclusion(:status, in: [:pending, :in_progress, :done])
      |> validate_length(:title, min: 1, max: 100)
      |> validate_change(:due_date, &validate_due_date/2)
  end

end
