
fun true_maker (x)
    = true;

datatype bool_or_int =
         Hot of bool
       | Cold of int;

fun hot_maker (x)
    = Hot;

fun help (f)
  = Hot (true_maker ( if true_maker (f)
                      then f
                      else true_maker));;

help (true_maker);

datatype chain =
         Link of (int * (int -> chain));

fun ints (n)
  = Link (n+1, ints);

ints (100);
ints (999);

fun skips (n)
  = Link (n+2, ints);

skips (100);
skips (999);

fun eq_int (n:int, m:int):bool = (n = m);

fun divides_evenly (n, c)
    = eq_int ((n mod c), 0);

divides_evenly (100, 2);
divides_evenly (100, 3);

fun is_mod_5_or_7 (n)
  = if divides_evenly (n, 5)
    then true
    else divides_evenly (n, 7);

is_mod_5_or_7 (100);
is_mod_5_or_7 (111);
is_mod_5_or_7 (112);

fun some_ints (n)
  = if is_mod_5_or_7 (n+1)
    then Link (n+1, some_ints)
    else some_ints (n+1);

some_ints (110);
some_ints (111);
some_ints (116);

(* nth item in the chain *)
fun chain_item (n, Link (i, f))
  = if eq_int (n, 1)
    then i
    else chain_item (n-1, f (i));

chain_item (1000, ints (0));
chain_item (6, some_ints (1));
chain_item (37, some_ints (1));

fun is_prime (n)
  = has_no_divisors (n, n-1)
and has_no_divisors (n, c)
  = if eq_int (c, 1)
    then true
    else
        if divides_evenly (n, c)
        then false
        else has_no_divisors (n, c-1);

is_prime (1000);
is_prime (1001);
is_prime (101);
is_prime (103);
is_prime (111);

fun primes (n)
  = if is_prime (n+1)
    then Link (n+1, primes)
    else primes (n+1);

chain_item (12, primes (1));

fun fibs (n) (m)
  = Link (n+m, fibs (m));

chain_item (42, fibs (1) (1));





