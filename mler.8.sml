
datatype 'a list
  = Empty
  | Cons of 'a * 'a list;

Empty;
Cons (10, Cons (20, Empty));

datatype orapl =
         Apple
       | Orange;

fun eq_orapl (Orange, Orange)
  = true
  | eq_orapl (Apple, Apple)
  = true
  | eq_orapl (a, b)
  = false;

fun eq_int (n:int, m:int):bool = (n = m);

fun subst_int (n, a, Empty)
    = Empty
  | subst_int (n, a, Cons (x, y))
    = if (eq_int (a, x))
      then Cons (n, subst_int (n, a, y))
      else Cons (x, subst_int (n, a, y));

subst_int (99, 10, Cons (10, Cons (20, Cons (10, Cons (30, Empty)))));

fun subst_orapl (n, a, Empty)
    = Empty
  | subst_orapl (n, a, Cons (x, y))
    = if (eq_orapl (a, x))
      then Cons (n, subst_orapl (n, a, y))
      else Cons (x, subst_orapl (n, a, y));

subst_orapl (Orange, Apple,
             Cons (Apple,
                   Cons (Apple,
                         Cons (Apple,
                               Cons (Orange, Empty)))));

fun subst (rel, n, a, Empty)
    = Empty
  | subst (rel, n, a, Cons (x, y))
    = if (rel (a, x))
      then Cons (n, subst (rel, n, a, y))
      else Cons (x, subst (rel, n, a, y));


subst (eq_orapl, Orange, Apple,
       Cons (Apple,
             Cons (Apple,
                   Cons (Apple,
                         Cons (Orange, Empty)))));

fun less_than (x, y) = x < y;
    
fun in_range ((small, large), x)
  = if less_than (small, x)
    then less_than (x, large)
    else false;



fun subst_pred (pred, n, Empty)
    = Empty
  | subst_pred (pred, n, Cons (x, y))
    = if (pred (x))
      then Cons (n, subst_pred (pred, n, y))
      else Cons (x, subst_pred (pred, n, y));

fun is_apple (x)
  = eq_orapl (Apple, x);

subst_pred (is_apple, Orange,
            Cons (Apple,
                  Cons (Apple,
                        Cons (Apple,
                              Cons (Orange, Empty)))));

fun less_than_15 (x)
  = less_than (x, 15);


subst_pred (less_than_15, 11,
            Cons (15,
                  Cons (6,
                        Cons (15,
                              Cons (17,
                                    Cons (15,
                                          Cons (8, Empty)))))));

fun in_range_11_16 (x)
  = if less_than (11, x)
    then less_than (x, 16)
    else false;

subst_pred (in_range_11_16, 11,
            Cons (15,
                  Cons (6,
                        Cons (15,
                              Cons (17,
                                    Cons (15,
                                          Cons (8, Empty)))))));

fun in_range_c (small, large) (x)
  = if less_than (small, x)
    then less_than (x, large)
    else false;


subst_pred (in_range_c (11, 16), 22,
            Cons (15,
                  Cons (6,
                        Cons (15,
                              Cons (17,
                                    Cons (15,
                                          Cons (8, Empty)))))));



fun subst_pred_curry (pred) (n, Empty)
  = Empty
  | subst_pred_curry (pred) (n, Cons (x, y))
    = if (pred (x))
      then Cons (n, subst_pred_curry (pred) (n, y))
      else Cons (x, subst_pred_curry (pred) (n, y));

fun subst_c (pred)
  = fn (n, Empty)
       => Empty
     | (n, Cons (e, t))
       => if (pred (e))
          then Cons (n, subst_c (pred) (n, t))
          else Cons (e, subst_c (pred) (n, t));

fun combine (Empty, x)
    = x
  | combine (Cons (a, l1), x)
    = Cons (a, combine (l1, x));

combine (Cons (1,
               Cons (2,
                     Cons (3, Empty))),
         Cons (5,
               Cons (4,
                     Cons (7,
                           Cons (9, Empty)))));

fun combine_c (Empty) (x)
    = x
  | combine_c (Cons (a, l1)) (x)
    = Cons (a, combine_c (l1) (x));

combine_c (Cons (1,
                 Cons (2,
                       Cons (3, Empty))))
          (Cons (5,
                 Cons (4,
                       Cons (7,
                             Cons (9, Empty)))));

fun prefixer_123 (l)
  = Cons (1,
          Cons (2,
                Cons (3, l)));

prefixer_123 (combine_c (Cons (1,
                               Cons (2,
                                     Cons (3, Empty))))
                        (Cons (5,
                               Cons (4,
                                     Cons (7,
                                           Cons (9, Empty))))));

combine_c (Cons (1,
                 Cons (2,
                       Cons (3, Empty))));

fun waiting_prefix_123 (l)
  = Cons (1,
          combine_c (Cons (2,
                           Cons (3, Empty)))
         (l));








