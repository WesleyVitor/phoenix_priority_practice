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
end
