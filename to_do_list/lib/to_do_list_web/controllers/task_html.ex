defmodule ToDoListWeb.TaskHTML do
  use ToDoListWeb, :html

  embed_templates "task_html/*"


  attr :tasks, :string, required: true
  def list_all_tasks(assigns) do
    ~H"""
    <ul>
      <%= for item <- @tasks do%>
        <li> <%= item.title %> </li>
        <li> <%= item.description %> </li>
        <li> <%= item.due_date %> </li>
        <li> <%= item.status %> </li>
      <% end %>
    </ul>
    """
  end

  attr :task, :string, required: true
  def show_status(assigns) do
    ~H"""
      <%= if @task.status == :done  do%>
        <p><strong>Status:</strong> Concluída</p>
      <% end%>
      <% if @task.status == :pending do %>
        <p><strong>Status:</strong> Concluída</p>
      <% end %>
      <% if @task.status == :pending do %>
        <p><strong>Status:</strong> Em progresso</p>
      <% end %>
    """
  end
end
