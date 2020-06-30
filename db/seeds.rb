Grind.create!([
  {name: "French Press"},
  {name: "Pour Over"},
  {name: "Espresso"}
])

User.create!([
  {email: "test@test.com", password_digest: "$2a$12$2mWBzpCttvdRI7NfpPUvVOkhFyiiEUfCTwrDcVrOeBpsisGxXCHVS", uid: nil},
  {email: "tadea@tadea.com", password_digest: "$2a$12$fXUTPDzsPOtQAlFZjVWmaO8UsVY8nW4ChWT3sJgLg.j4mXnPTL.Hm", uid: nil}
])

Coffee.create!([
  {
    name: "Flagstaff",
    description: "Flagstaff is also the secret behind our famous Cold Brew. When steeped for 12 hours in room   temperature water, this blend produces a caramel sweetness, soft citric acidity and tones of milk chocolate with a  juicy finish.",
    process: "Natural",
    grind_id: 1,
    origin: "Brazil",
    user_id: 1
  },

  {
    name: "Nyeri",
    description: "This coffee boasts juicy notes of sweet-citrus, full-bodied chocolate, and a subtle zesty kick as it finishes. A truly exceptional, exciting, and vibrant coffee.",
    process: "Natural",
    grind_id: 1,
    origin: "Kenya",
    user_id: 1
  }
])


