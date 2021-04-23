defmodule Fakebusters.Boards.JoinRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "join_requests" do
    field :motivation, :string
    field :preferred_role, :integer
    field :user_id, :id
    field :board_id, :id

    timestamps()
  end

  @doc false
  def changeset(join_request, attrs) do
    join_request
    |> cast(attrs, [:motivation, :preferred_role])
    |> validate_required([:motivation, :preferred_role])
  end
end
