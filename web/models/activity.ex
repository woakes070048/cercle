defmodule CercleApi.Activity do
  use CercleApi.Web, :model

  @derive {Poison.Encoder, only: [
              :id, :title, :is_done, :due_date,
              :company_id, :contact_id, :user_id, :opportunity_id, :user
            ]}

  schema "activities" do
    belongs_to :opportunity, CercleApi.Opportunity
    belongs_to :user, CercleApi.User
    belongs_to :contact, CercleApi.Contact
    belongs_to :company, CercleApi.Company
    field :due_date, Ecto.DateTime
    field :is_done, :boolean, default: false
    field :title, :string

    timestamps
  end

  @required_fields ~w(user_id contact_id company_id)
  @optional_fields ~w(due_date is_done title  opportunity_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end
