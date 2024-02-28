
datatype 'a list
  = Empty
  | Cons of 'a * 'a list;

datatype box =
         Bacon
       | Ix of int;

fun is_bacon (Bacon)
  = true
  | is_bacon (_)
  = false;

fun where_is (Empty)
    = 0
  | where_is (Cons (Bacon, _))
    = 1
  | where_is (Cons (_, l))
    = 1 + where_is (l);

where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Bacon, Empty))));

where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Ix (12), Empty))));

fun where_is (Empty)
    = 0
  | where_is (Cons (a, l))
    = if is_bacon (a)
      then 1
      else 1+where_is (l);

where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Bacon, Empty))));

where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Ix (12), Empty))));

exception No_bacon of int;

fun where_is (Empty)
    = raise No_bacon (0)
  | where_is (Cons (a, l))
    = if is_bacon (a)
      then 1
      else 1+where_is (l);

where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Bacon, Empty))));

(where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Ix (12), Empty))))
 handle
 No_bacon (x)
 => x);

where_is;

exception No_bacon;

fun where_is (Empty)
    = raise No_bacon
  | where_is (Cons (a, l))
    = if is_bacon (a)
      then 1
      else 1+where_is (l);

where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Bacon, Empty))));

(where_is (Cons (Ix (10),
                Cons (Ix (11),
                      Cons (Ix (12), Empty))))
 handle No_bacon => 0);

where_is;

fun eq_int (n:int, m:int):bool = (n = m);

exception Out_of_range;
fun list_item (n, Empty)
    = raise Out_of_range
  | list_item (n, Cons (abox, rest))
    = if eq_int (n, 1)
      then abox
      else list_item (n-1, rest);

(list_item (111,
            Cons (Ix (10),
                  Cons (Ix (11),
                        Cons (Bacon,
                              Cons (Ix (10),
                                    Cons (Ix (11),
                                          Cons (Bacon, Empty)))))))
 handle Out_of_range
        => Ix (1111));


val t = Cons (Ix (5),
              Cons (Ix (4),
                    Cons (Bacon,
                          Cons (Ix (2),
                                Cons (Ix (7),
                                      Empty)))));


fun find (n, boxes)
    = check (n, boxes, list_item (n, boxes))
and check (n, boxes, Bacon)
    = n
  | check (n, boxes, Ix (i))
    = find (i, boxes);

(find (1, t)
 handle Out_of_range
        => ~1);

(find (7, t)
 handle Out_of_range
        => ~1);

(* infinite loop *)
(* (find (4, t) *)
(*  handle Out_of_range *)
(*         => ~1); *)

(* restart the search when Out_of_range is raised *)
fun find (n, boxes)
  = (check (n, boxes, list_item (n, boxes))
     handle
     Out_of_range
     => find (n div 2, boxes))
and check (n, boxes, Bacon)
    = n
  | check (n, boxes, Ix (i))
    = find (i, boxes);

find (1, t);

fun path (n, boxes)
  = Cons (n,
          (check (n, boxes, list_item (n, boxes))
           handle
           Out_of_range
           => path (n div 2, boxes)))
and check (n, boxes, Bacon)
    = Empty
  | check (n, boxes, Ix (i))
    = path (i, boxes);

path (1, t);

fun path (n, boxes)
  = Cons (n,
          (check (boxes, list_item (n, boxes))
           handle
           Out_of_range
           => path (n div 2, boxes)))
and check (boxes, Bacon)
    = Empty
  | check (boxes, Ix (i))
    = path (i, boxes);

path (1, t);
