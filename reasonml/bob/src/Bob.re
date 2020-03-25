let isQuestion = str => {
  let lastIndex = String.length(str) - 1;
  if (str.[lastIndex] == '?') {
    true;
  } else {
    false;
  };
};

let isUppercase = str => {
  str == String.uppercase_ascii(str) && str != String.lowercase_ascii(str);
};

let isEmpty = str => {
  String.trim(str) == "";
};

let hey = str =>
  if (isEmpty(str)) {
    "Fine. Be that way!";
  } else {
    let trimmed = String.trim(str);
    if (isQuestion(trimmed)) {
      if (isUppercase(trimmed)) {
        "Calm down, I know what I'm doing!";
      } else {
        "Sure.";
      };
    } else {
      "Whatever";
    };
  };
