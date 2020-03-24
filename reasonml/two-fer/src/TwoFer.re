let twoFer = name =>
    switch (name) {
    | Some(actualName) => "One for " ++ actualName ++ ", one for me."
    | None => "One for you, one for me."
    }
