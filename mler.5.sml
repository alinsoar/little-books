

datatype 'a pizza =
         Bottom
       | Topping of ('a * ('a pizza));



datatype fish =
         Anchovy
       | Lox
       | Tuna;


Topping (Anchovy, Bottom);
Topping (Tuna,
         Topping (Anchovy, Bottom));
Topping (Anchovy,
         Topping (Tuna,
                  Topping (Anchovy, Bottom)));

fun rem_anchovy (Bottom)
    = Bottom
  | rem_anchovy (Topping (Anchovy, x))
    = rem_anchovy (x)
  | rem_anchovy (Topping (Lox, x))
    = Topping (Lox, rem_anchovy (x))
  | rem_anchovy (Topping (Tuna, x))
    = Topping (Tuna, rem_anchovy (x));


rem_anchovy (Bottom);
rem_anchovy (Topping (Tuna, Bottom));
rem_anchovy (Topping (Anchovy, (Topping (Tuna, Bottom))));
rem_anchovy (Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));




fun rem_anchovy (Bottom)
    = Bottom
  | rem_anchovy (Topping (Anchovy, x))
    = rem_anchovy (x)
  | rem_anchovy (Topping (fish, x))
    = Topping (fish, rem_anchovy (x));


rem_anchovy (Bottom);
rem_anchovy (Topping (Tuna, Bottom));
rem_anchovy (Topping (Anchovy, (Topping (Tuna, Bottom))));
rem_anchovy (Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));




fun rem_tuna (Bottom)
    = Bottom
  | rem_tuna (Topping (Anchovy, x))
    = Topping (Anchovy, rem_tuna (x))
  | rem_tuna (Topping (Lox, x))
    = Topping (Lox, rem_tuna (x))
  | rem_tuna (Topping (Tuna, x))
    = rem_tuna (x);


rem_tuna (Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));



fun rem_tuna (Bottom)
    = Bottom
  | rem_tuna (Topping (Tuna, x))
    = rem_tuna (x)
  | rem_tuna (Topping (t, x))
    = Topping (t, rem_tuna (x));

rem_tuna (Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));

fun eq_fish (Anchovy, Anchovy)
    = true
  | eq_fish (Tuna, Tuna)
    = true
  | eq_fish (Lox, Lox)
    = true
  | eq_fish (a, b)
    = false

fun rem_fish (x, Bottom)
    = Bottom
  | rem_fish (x, Topping (t, rest))
    = if eq_fish (t, x)
      then rem_fish (x, rest)
      else Topping (t, rem_fish (x, rest));


rem_fish (Tuna, Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));
rem_fish (Lox, Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));
rem_fish (Anchovy, Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));

fun eq_int (n:int, m:int):bool = (n = m);

eq_int (100, 200);
eq_int (100, 100);

fun rem_int (x, Bottom)
    = Bottom
  | rem_int (x, Topping (t, rest))
    = if eq_int (t, x)
      then rem_int (x, rest)
      else Topping (t, rem_int (x, rest));



rem_int (100, Topping (10, (Topping (20, Bottom))));
rem_int (100, Topping (10, (Topping (100, (Topping (30, Bottom))))));

fun subst_fish (x, y, Bottom)
    = Bottom
  | subst_fish (x, y, Topping (t, rest))
    = if eq_fish (t, x)
      then Topping (y, subst_fish (x, y, rest))
      else Topping (t, subst_fish (x, y, rest));

subst_fish (Anchovy, Lox, Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));
subst_fish (Lox, Anchovy, Topping (Lox, (Topping (Anchovy, (Topping (Tuna, Bottom))))));

fun subst_int (x, y, Bottom)
    = Bottom
  | subst_int (x, y, Topping (t, rest))
    = if eq_int (t, x)
      then Topping (y, subst_int (x, y, rest))
      else Topping (t, subst_int (x, y, rest));


subst_int (100, 200, Topping (10, (Topping (100, (Topping (30, Bottom))))));
subst_int (100, 200, Topping (10, (Topping (20, Bottom))));



datatype num =
         Zero
       | succ of num;

fun eq_num (Zero, Zero)
    = true
  | eq_num (succ (x), succ (y))
    = eq_num (x, y)
  | eq_num (a, b)
    = false;
  
eq_num (Zero, Zero);
eq_num (succ (Zero), Zero);
eq_num (succ (Zero), succ (Zero));
