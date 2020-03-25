let rna_of_dna: dna => rna =
  dna => {
    switch (dna) {
    | A => U
    | C => G
    | G => C
    | T => A
    };
  };

let toRna: list(dna) => list(rna) =
  dnaList => {
    List.map(rna_of_dna, dnaList);
  };
