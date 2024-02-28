
datatype fruit =
         Peach
       | Apple
       | Pear
       | Lemon
       | Fig

datatype tree =
         Bud
       | Flat of fruit * tree
       | Split of tree * tree

fun flat_only (Bud)
    = true
  | flat_only (Flat (f, t))
    = flat_only (t)
  | flat_only (Split (t1, t2))
    = false;

flat_only (Flat (Apple, Flat (Peach, Bud)));
flat_only (Split (Bud, Flat (Apple, Flat (Peach, Bud))));



fun split_only (Bud)
    = true
  | split_only (Flat (f, t))
    = false
  | split_only (Split (t1, t2))
    = (split_only (t1) andalso
       split_only (t2));


split_only (Flat (Apple, Flat (Peach, Bud)));
split_only (Split (Bud, Flat (Apple, Flat (Peach, Bud))));
split_only (Split (Bud,
                   Split (Split (Bud,
                                 Split (Bud, Bud)),
                          Split (Bud, Bud))));

fun contains_fruit (Bud)
    = false
  | contains_fruit (Flat (f, t))
    = true
  | contains_fruit (Split (t1, t2))
    = contains_fruit (t1) orelse contains_fruit (t2);

contains_fruit (Flat (Apple, Flat (Peach, Bud)));
contains_fruit (Split (Bud, Flat (Apple, Flat (Peach, Bud))));
contains_fruit (Split (Bud,
                       Split (Split (Bud,
                                     Split (Bud, Bud)),
                              Split (Bud, Bud))));

"---HEIGHT";
fun max (n1, n2) = if n1>n2 then n1 else n2;


fun height (Bud)
    = 0
  | height (Flat (f, t))
    = 1+height (t)
  | height (Split (t1, t2))
    = 1+max (height (t2),
             height (t2));

height (Flat (Apple, Flat (Peach, Bud)));
height (Split (Bud, Flat (Apple, Flat (Peach, Bud))));
height (Split (Bud,
               Split (Split (Bud,
                             Split (Bud, Bud)),
                      Split (Bud, Bud))));

height (Split (
        Split (Bud,
               Flat (Lemon,
                     Bud)),
        Flat (Fig,
              Split (Bud,
                     Bud))));

height (Split (Bud,
               Flat (Lemon,
                     Bud)));
height (Split (Bud, Bud));
height (Bud);
height (Flat(Lemon,
             Bud));

fun eq_fruit (Peach, Peach)
    = true
  | eq_fruit (Apple, Apple)
    = true
  | eq_fruit (Pear, Pear)
    = true
  | eq_fruit (Lemon, Lemon)
    = true
  | eq_fruit (Fig, Fig)
    = true
  | eq_fruit (s, t)
    = false;

eq_fruit (Peach, Apple);


fun subst_in_tree (x, y, Bud)
    = Bud
  | subst_in_tree (x, y, Flat (f, t))
    = if eq_fruit (x, f)
      then Flat (y, subst_in_tree (x, y, t))
      else Flat (f, subst_in_tree (x, y, t))
  | subst_in_tree (x, y, Split (t1, t2))
    = Split (subst_in_tree (x, y, t1),
             subst_in_tree (x, y, t2));

subst_in_tree (Apple, Peach, Split (Bud, Bud));
subst_in_tree (Apple, Peach, Flat (Apple,
                                   Flat (Peach, Bud)));
subst_in_tree (Apple, Peach, Split (Flat (Peach, Bud),
                                    Flat (Apple, Flat (Apple, Bud))));


fun occurs (x, Bud)
  = 0
  | occurs (x, Flat (f, t))
    = if eq_fruit (x, f)
      then 1+occurs (x, t)
      else occurs (x, t)
  | occurs (x, Split (t1, t2))
    = occurs (x, t1) + occurs (x, t2);


occurs (Apple, Bud);
occurs (Apple, Flat (Apple, Flat(Apple, Bud)));
occurs (Apple, Split (Flat (Apple, Flat(Apple, Bud)),
                      Flat (Apple, Flat(Apple, Bud))));

datatype 'a slist =
    Empty
  | Scons of (('a sexp) * ('a slist))
and 'a sexp =
    An_atom of 'a
  | A_slist of ('a slist);

fun occurs_in_slist (a, Empty)
    = 0
  | occurs_in_slist (a, Scons (f, r))
    = occurs_in_sexp (a,f) + occurs_in_slist (a,r)
and occurs_in_sexp (a, An_atom (x))
    = if eq_fruit (a, x)
      then 1
      else 0
  | occurs_in_sexp (a, A_slist (s))
    = occurs_in_slist (a,s);

occurs_in_slist (Fig,
                 Scons (A_slist (Scons (An_atom (Fig),
                                        Scons (An_atom (Peach), Empty))),
                        Scons (An_atom (Fig),
                               Scons (An_atom (Lemon), Empty))));

fun rem_from_slist (a, Empty)
    = Empty
  | rem_from_slist (a, Scons (f, r))
    = Scons (rem_from_sexp (a,f),
             rem_from_slist (a,r))
and rem_from_sexp (a, An_atom (x))
    = if eq_fruit (a, x)
      then A_slist (Empty)
      else An_atom (x)
  | rem_from_sexp (a, A_slist (s))
    = A_slist (rem_from_slist (a,s));

rem_from_slist (Fig,
                Scons (A_slist (Scons (An_atom (Fig),
                                       Scons (An_atom (Pear),
                                              Empty))),
                       Scons (An_atom (Fig),
                              Scons (An_atom (Lemon), Empty))));

fun eq_fruit_in_atom (a, An_atom (x))
    = eq_fruit (a, x)
  | eq_fruit_in_atom (a, _)
    = false

fun rem_from_slist (a, Empty)
    = Empty
  | rem_from_slist (a, Scons (f, r))
    = if eq_fruit_in_atom (a, f)
      then rem_from_slist (a,r)
      else Scons (rem_from_sexp (a,f),
                  rem_from_slist (a,r))
and rem_from_sexp (a, An_atom (x))
    = if eq_fruit (a, x)
      then A_slist (Empty)
      else An_atom (x)
  | rem_from_sexp (a, A_slist (s))
    = A_slist (rem_from_slist (a,s));

rem_from_slist (Fig,
                Scons (A_slist (Scons (An_atom (Fig),
                                       Scons (An_atom (Pear),
                                              Empty))),
                       Scons (An_atom (Fig),
                              Scons (An_atom (Lemon), Empty))));


fun rem_from_slist (a, Empty)
    = Empty
  | rem_from_slist (a, Scons (f, r))
    = if eq_fruit_in_atom (a, f)
      then rem_from_slist (a,r)
      else Scons (rem_from_sexp (a,f),
                  rem_from_slist (a,r))
and rem_from_sexp (a, An_atom (x))
    = An_atom (x)
  | rem_from_sexp (a, A_slist (s))
    = A_slist (rem_from_slist (a,s));

rem_from_slist (Fig,
                Scons (A_slist (Scons (An_atom (Fig),
                                       Scons (An_atom (Pear),
                                              Empty))),
                       Scons (An_atom (Fig),
                              Scons (An_atom (Lemon), Empty))));

fun rem_from_slist (a, Empty)
    = Empty
  | rem_from_slist (a, Scons (An_atom (w), r))
    = if eq_fruit (a, w)
      then rem_from_slist (a,r)
      else Scons (An_atom (w),
                  rem_from_slist (a,r))
  | rem_from_slist (a, Scons (A_slist (s), r))
    = Scons (A_slist (rem_from_slist (a, s)),
             rem_from_slist (a, r))
and rem_from_sexp (a, An_atom (x))
    = An_atom (x)
  | rem_from_sexp (a, A_slist (s))
    = A_slist (rem_from_slist (a,s));

rem_from_slist (Fig,
                Scons (A_slist (Scons (An_atom (Fig),
                                       Scons (An_atom (Pear),
                                              Empty))),
                       Scons (An_atom (Fig),
                              Scons (An_atom (Lemon), Empty))));






