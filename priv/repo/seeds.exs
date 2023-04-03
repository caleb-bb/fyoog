# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Fyoog.Repo.insert!(%Fyoog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Fyoog.Accounts.User
alias Fyoog.Repo

Repo.transaction(fn ->
  password = "fakepass#300"

  Repo.insert!(%User{
    email: "beerscb@gmail.com",
    password: password,
    hashed_password: Bcrypt.hash_pwd_salt(password)
  })
end)
