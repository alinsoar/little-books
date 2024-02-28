
fun eq_int (n:int, m:int):bool = (n = m);

datatype num =
         Zero
       | One_more_than of num
exception Too_small

signature N =
sig
    type number
    exception Too_small
    val succ:number -> number
    val pred:number -> number
    val is_zero:number -> bool
end

functor NumberAsNum ()
        :>
        N
  =
struct
datatype num =
         Zero
       | One_more_than of num
type number = num
exception Too_small
fun succ (n)
    = One_more_than (n)
fun pred (Zero)
    = raise Too_small
  | pred (One_more_than (n))
    = n
fun is_zero (Zero)
    = true
  | is_zero (_)
    = false
end

functor NumberAsInt ()
        :>
        N
  =
struct
type number = int
exception Too_small
fun succ (n)
    = n+1
fun pred (0)
    = raise Too_small
  | pred (n)
    = n-1
fun is_zero (0)
    = true
  | is_zero (_)
    = false
end;

structure IntStruct = NumberAsInt ();
structure NumStruct = NumberAsNum ();

signature P =
sig
    type number
    val plus: (number * number) -> number
end

functor PON (structure a_N: N)
        :>
        P
  =
struct
type number = a_N.number
fun plus (n, m)
  = if a_N.is_zero (n)
    then m
    else a_N.succ (plus (a_N.pred (n), m))
end;

structure IntArith = PON (structure a_N = IntStruct);

(* IntArith.plus (1,2) *)

signature N_C_R =
sig
    type number
    exception Too_small
    val conceal:int -> number
    val succ:number -> number
    val pred:number -> number
    val is_zero:number -> bool
    val reveal:number -> int
end

functor NumberAsNum ()
        :>
        N_C_R
  =
struct
datatype num =
         Zero
       | One_more_than of num
type number = num
exception Too_small
fun conceal (n)
  = if eq_int (n, 0)
    then Zero
    else One_more_than (conceal (n-1))
fun succ (n)
    = One_more_than (n)
fun pred (Zero)
    = raise Too_small
  | pred (One_more_than (n))
    = n
fun is_zero (Zero)
    = true
  | is_zero (_)
    = false
fun reveal (n)
    = if is_zero (n)
      then 0
      else 1+reveal (pred (n))
end

functor NumberAsInt ()
        :>
        N_C_R
  =
struct
type number = int
exception Too_small
fun conceal (n)
    = n
fun succ (n)
    = n+1
fun pred (0)
    = raise Too_small
  | pred (n)
    = n-1
fun is_zero (0)
    = true
  | is_zero (_)
    = false
fun reveal (n)
    = n
end;

structure IntStruct = NumberAsInt ();
structure NumStruct = NumberAsNum ();
structure IntArith = PON (structure a_N = IntStruct);
structure NumArith = PON (structure a_N = NumStruct);

(* IntArith.plus (1,2) *)
NumStruct.conceal (0);
NumStruct.succ(NumStruct.conceal (0));
NumStruct.reveal(NumStruct.succ(NumStruct.conceal (0)));

NumStruct.reveal(NumStruct.succ(
                 NumStruct.succ(
                 NumStruct.succ(
                 NumStruct.succ(
                 NumStruct.conceal (0))))));

(* NumStruct.reveal(NumArith.plus(NumStruct.conceal(1), *)
(*                                NumStruct.conceal (0))); *)

functor PON (structure a_N: N)
        :>
        P where type number = a_N.number
  =
  struct
type number = a_N.number
fun plus (n, m)
  = if a_N.is_zero (n)
    then m
    else a_N.succ (plus (a_N.pred (n), m))
end;

structure IntStruct = NumberAsInt ();
structure NumStruct = NumberAsNum ();
structure IntArith = PON (structure a_N = IntStruct);
structure NumArith = PON (structure a_N = NumStruct);

NumStruct.reveal(NumArith.plus(NumStruct.conceal(1),
                               NumStruct.conceal (2)));

IntStruct.reveal(IntArith.plus(IntStruct.conceal(1),
                               IntStruct.conceal (2)));

functor NumberAsInt2 ()
        :>
        N where type number = int
  =
struct
type number = int
exception Too_small
fun succ (n)
    = n+1
fun pred (0)
    = raise Too_small
  | pred (n)
    = n-1
fun is_zero (0)
    = true
  | is_zero (_)
    = false
end;

structure IntStruct2 = NumberAsInt2 ();
structure IntArith2 = PON (structure a_N = IntStruct2);


IntArith2.plus (1, 2);

signature S =
sig
    type number1
    type number2
    val similar: (number1 * number2) -> bool
end

functor Same (structure a_N: N
              structure b_N: N)
        :>
        S where type number1 = a_N.number
          where type number2 = b_N.number
  =
  struct
  type number1 = a_N.number
  type number2 = b_N.number
  fun sim (n, m)
    = if a_N.is_zero (n)
      then b_N.is_zero (m)
      else sim (a_N.pred (n),
                b_N.pred (m))
  fun similar (n,m)
    = ((sim (n,m)
        handle
        a_N.Too_small => false)
           handle
           b_N.Too_small => false)
  end

structure SimIntNum = Same (structure a_N = IntStruct
                            structure b_N = NumStruct)

structure SimNumInt = Same (structure a_N = NumStruct
                            structure b_N = IntStruct);

SimNumInt.similar (NumStruct.conceal (0), IntStruct.conceal (0));
SimNumInt.similar (NumStruct.conceal (0), IntStruct.conceal (1));


SimIntNum.similar (IntStruct.conceal (0), NumStruct.conceal (0));
SimIntNum.similar (IntStruct.conceal (0), NumStruct.conceal (1));


structure SimNumNum = Same (structure a_N = NumStruct
                            structure b_N = NumStruct);

SimNumNum.similar (NumStruct.conceal (0), NumStruct.conceal (0));
SimNumNum.similar (NumStruct.conceal (0), NumStruct.conceal (1));


fun new_plus (x, y)
  = NumStruct.reveal (
    NumArith.plus (
    NumStruct.conceal (x),
    NumStruct.conceal (y)));

new_plus (1, 2);

signature J =
sig
    val new_plus: (int * int) -> int
end;

functor NP (structure a_N: N_C_R
            structure a_P: P
            sharing type
            a_N.number
            =
            a_P.number)
        :>
        J
  =
struct
fun new_plus (x, y)
  = a_N.reveal (
    a_P.plus (
    a_N.conceal (x),
    a_N.conceal (y)))
end;



structure NPStruct = NP (
structure a_N = NumberAsNum ()
structure a_P = PON (structure a_N = a_N));

