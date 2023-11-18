defmodule IntegrationBeeWeb.MatchLive.Index do
  use IntegrationBeeWeb, :live_view

  alias IntegrationBee.Competition
  alias IntegrationBee.Competition.Match

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :matches, Competition.list_matches())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Match")
    |> assign(:match, Competition.get_match!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Match")
    |> assign(:match, %Match{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Matches")
    |> assign(:match, nil)
  end

  @impl true
  def handle_info({IntegrationBeeWeb.MatchLive.FormComponent, {:saved, match}}, socket) do
    {:noreply, stream_insert(socket, :matches, match)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    match = Competition.get_match!(id)
    {:ok, _} = Competition.delete_match(match)

    {:noreply, stream_delete(socket, :matches, match)}
  end
end
