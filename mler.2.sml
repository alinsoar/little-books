
datatype shish_kebab =
         Skewer
       | Onion of shish_kebab
       | Lamb of shish_kebab
       | Tomato of shish_kebab;

Skewer;
Onion(Skewer);
Onion(Lamb(Onion(Skewer)));

fun only_onions (Skewer)
    = true
  | only_onions(Onion(x))
    = only_onions(x)
  | only_onions(Lamb(x))
    = false
  | only_onions(Tomato(x))
    = false;

only_onions;
only_onions(Onion(Skewer));
only_onions(Onion(Onion(Skewer)));
only_onions(Onion(Lamb(Skewer)));

fun is_vegetarian (Skewer)
    = true
  | is_vegetarian(Onion(x))
    = is_vegetarian(x)
  | is_vegetarian(Lamb(x))
    = false
  | is_vegetarian(Tomato(x))
    = is_vegetarian(x);

is_vegetarian(Skewer);
is_vegetarian( Lamb( Onion( Skewer)));

datatype 'a shish =
         Bottom of 'a
       | Onion of 'a shish
       | Lamb of 'a shish
       | Tomato of 'a shish;

Bottom;
Bottom (10);
Bottom (Bottom);
Bottom (Bottom (Bottom));
Bottom (Bottom (Bottom (Bottom)));
Bottom (Bottom (Bottom (Bottom (Bottom))));

datatype rod =
         Dagger
       | Fork
       | Sword;

datatype plate =
         Gold_plate
       | Silver_plate
       | Brass_plate;

Bottom (Dagger);
Onion (Bottom (Dagger));

fun is_veggie (Bottom (_))
    = true
  | is_veggie (Onion (x))
    = is_veggie (x)
  | is_veggie (Lamb (x))
    = false
  | is_veggie (Tomato (x))
    = is_veggie (x);

is_veggie (Bottom (10));
is_veggie (Bottom (Fork));
is_veggie (Onion (Bottom (10)));
is_veggie (Onion (Bottom (Dagger)));
is_veggie (Lamb (Onion (Bottom (Dagger))));

(* order permutted *)
fun what_bottom (Bottom (x))
    = x
  | what_bottom (Lamb (x))
    = what_bottom (x)
  | what_bottom (Onion (x))
    = what_bottom (x)
  | what_bottom (Tomato (x))
    = what_bottom (x);


what_bottom (Bottom (10));
what_bottom (Bottom (true));
what_bottom (Onion (Bottom (Fork)));
what_bottom (Lamb (Onion (Bottom (Brass_plate))));






