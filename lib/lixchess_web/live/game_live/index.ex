defmodule LixchessWeb.GameLive.Index do
  use LixchessWeb, :live_view

  def board(assigns) do
    ~H"""
    <div class="flex flex-col">
      <div class="flex-1 flex flex-col">
        <div class="flex-1 flex flex-col">
          <%= for row <- 8..1//-1 do %>
            <div class="flex">
              <%= for col <- ["a", "b", "c", "d", "e", "f", "g", "h"] do %>
                <div class="w-1/8 h-1/8 bg-gray-200 border-2 border-black"><%= col %>, <%= row %></div>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
