let days_of_seconds = seconds => seconds /. 86400.

let years_of_days = (planet, days) => {
  switch (planet) {
    | Mercury => days /. 87.969257175
    | Venus => days /. 224.700799215
    | Earth => days /. 365.25
    | Mars => days /. 686.96797095
    | Jupiter => days /. 4332.82012875
    | Saturn => days /. 10755.6986445
    | Uranus => days /. 30687.1530015
    | Neptune => days /. 60190.02963
  }
}
let ageOn = (planet, seconds) => {
  seconds |> days_of_seconds |> years_of_days(planet);
}
