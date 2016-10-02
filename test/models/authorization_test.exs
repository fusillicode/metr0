defmodule Metr0.AuthorizationTest do
  use Metr0.ModelCase

  alias Metr0.Authorization

  @valid_attrs %{aud: "some content", claims: %{}, exp: "some content", iss: "some content", jwt: "some content", provider: "some content", sub: "some content", uid: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Authorization.changeset(%Authorization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Authorization.changeset(%Authorization{}, @invalid_attrs)
    refute changeset.valid?
  end
end
