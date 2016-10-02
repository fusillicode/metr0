defmodule Metr0.User do
  use Metr0.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    has_many :authorizations, Metr0.Authorization

    timestamps()
  end

  @required_fields ~w(email name)a
  @optional_fields ~w()a

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
  end
end
