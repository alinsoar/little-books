1+1;

5.32;

datatype seasoning =
         Salt
       | Pepper;

"---num";
datatype num =
         Zero
       | next of num;


Zero;
next Zero;
next (next Zero);

datatype 'alpha open_faced_sandwich =
         Bread of 'alpha
       | Slice of 'alpha open_faced_sandwich;

"---Bread";
Bread;
Bread (0);
Bread (Bread (0));




"done"



    
