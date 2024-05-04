defmodule ToDoList.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :string
      add :due_date, :date
      add :status, :string

      timestamps()
    end
  end
end
