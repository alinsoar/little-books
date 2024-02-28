
datatype meza =
         Shrimp
       | Calamari
       | Escargots
       | Hummus;


datatype main =
         Steak
       | Ravioli
       | Chicken
       | Eggplant;

datatype salad =
         Green
       | Cucumber
       | Greek;

datatype dessert =
         Sundae
       | Mousse
       | Torte;


fun add_a_steak (Shrimp)
  = (Shrimp, Steak)
  | add_a_steak (Calamari)
  = (Calamari, Steak)
  | add_a_steak (Escargots)
  = (Escargots, Steak)
  | add_a_steak (Hummus)
  = (Hummus, Steak);

add_a_steak (Shrimp);

fun add_a_steak (x)
  = (x, Steak);

add_a_steak (10);
add_a_steak (Mousse);


fun eq_main (Steak, Steak)
  = true
  | eq_main (Ravioli, Ravioli)
  = true
  | eq_main (Chicken, Chicken)
  = true
  | eq_main (Eggplant, Eggplant)
    = true
  | eq_main (x, y)
    = false;


eq_main (Steak, Steak);
eq_main (Steak, Chicken);


fun has_steak (a, Steak, b)
  = true
  | has_steak (a, x, b)
  = false;
    
has_steak (10, Eggplant, 20);
has_steak (10, Steak, true);


fun has_steak (a:meza, Steak, d:dessert):bool
  = true
  | has_steak (a, x, b)
  = false;

has_steak (Escargots, Steak, Mousse);

fun add_a_steak (x:meza):(meza*main)
  = (x, Steak);

add_a_steak (Shrimp);


