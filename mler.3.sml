
datatype pizza =
         Crust
       | Cheese of pizza
       | Onion of pizza
       | Anchovy of pizza
       | Sausage of pizza;

fun remove_anchovy (Crust)
    = Crust
  | remove_anchovy (Cheese (x))
    = Cheese(remove_anchovy (x))
  | remove_anchovy (Onion (x))
    = Onion(remove_anchovy (x))
  | remove_anchovy (Anchovy (x))
    = remove_anchovy (x)
  | remove_anchovy (Sausage (x))
    = Sausage(remove_anchovy (x));

remove_anchovy (Sausage (Onion (Anchovy (Cheese (Anchovy (Crust))))));

fun top_anchovy_with_cheese (Crust)
    = Crust
  | top_anchovy_with_cheese (Cheese (x))
    = Cheese(top_anchovy_with_cheese (x))
  | top_anchovy_with_cheese (Onion (x))
    = Onion(top_anchovy_with_cheese (x))
  | top_anchovy_with_cheese (Anchovy (x))
    = Cheese (Anchovy (top_anchovy_with_cheese (x)))
  | top_anchovy_with_cheese (Sausage (x))
    = Sausage(top_anchovy_with_cheese (x));

top_anchovy_with_cheese;
top_anchovy_with_cheese (Crust);
top_anchovy_with_cheese (Anchovy (Crust));
top_anchovy_with_cheese (Sausage (Anchovy (Onion (Cheese (Anchovy (Crust))))));


