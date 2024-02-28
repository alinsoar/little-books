// -*- mode: java; buffer-read-only: t -*-

abstract class PizzaD {
    abstract PizzaD remA();
    abstract PizzaD topAwC();
    abstract PizzaD subAbC();
};
class Crust extends PizzaD {
    PizzaD remA() {
        return new Crust();
    }
    PizzaD topAwC() {
        return new Crust();
    }
    PizzaD subAbC() {
        return new Crust();
    }
    public String toString() {
        return "Crust";
    }
}
class Cheese extends PizzaD {
    PizzaD p;
    Cheese(PizzaD _p) {
        p = _p;
    }
    // ----------------------------------------
    PizzaD remA() {
        return new Cheese(p.remA());
    }
    PizzaD topAwC() {
        return new Cheese(p.topAwC());
    }
    PizzaD subAbC() {
        return new Cheese(p.subAbC());
    }
    public String toString() {
        return String.format("Cheese %s", p);
    }
}
class Olive extends PizzaD {
    PizzaD p;
    Olive(PizzaD _p) {
        p = _p;
    }
    // ----------------------------------------
    PizzaD remA() {
        return new Olive(p.remA());
    }
    PizzaD topAwC() {
        return new Olive(p.topAwC());
    }
    PizzaD subAbC() {
        return new Olive(p.subAbC());
    }
    public String toString() {
        return String.format("Olive %s", p);
    }
}
class Anchovy extends PizzaD {
    PizzaD p;
    Anchovy(PizzaD _p) {
        p = _p;
    }
    // ----------------------------------------
    PizzaD remA() {
        return p.remA();
    }
    PizzaD topAwC() {
        return
            new Cheese
            (new Anchovy
             (p.topAwC()));
    }
    PizzaD subAbC() {
        return new Cheese(p.subAbC());
    }
    public String toString() {
        return String.format("Anchovy %s", p);
    }
}
class Sausage extends PizzaD {
    PizzaD p;
    Sausage(PizzaD _p) {
        p = _p;
    }
    // ----------------------------------------
    PizzaD remA() {
        return new Sausage(p.remA());
    }
    PizzaD topAwC() {
        return new Sausage(p.topAwC());
    }
    PizzaD subAbC() {
        return new Sausage(p.subAbC());
    }
    public String toString() {
        return String.format("Sausage %s", p);
    }
}
class Spinach extends PizzaD {
    PizzaD p;
    Spinach(PizzaD _p) {
        p = _p;
    }
    // ----------------------------------------
    PizzaD remA() {
        return new Spinach(p.remA());
    }
    PizzaD topAwC() {
        return new Spinach(p.topAwC());
    }
    PizzaD subAbC() {
        return new Spinach(p.subAbC());
    }
    public String toString() {
        return String.format("Spinach %s", p);
    }
}

class Test {
    static void p(Object... objs) {
        for(Object o:objs) {
            System.out.printf("%s ", o);
        }
    }
    static private void test1() {
        Crust p1 = new Crust();
        Cheese p2 = new Cheese(p1);
        Anchovy p3 = new Anchovy(p2);
        Cheese p4 = new Cheese(p3);
        Olive p5 = new Olive(p4);
        Spinach p6 = new Spinach(p5);
        PizzaD x1 = p6.remA();
        PizzaD x2 = p6.topAwC();
        PizzaD x3 = p6.subAbC();
        p(p6, ";\n",
          x1, "; REM\n",
          x2, "; TOP\n",
          x3, "; SUBST\n",
          new Cheese(new Anchovy(new Crust())).topAwC(), ";\n",
          new Anchovy(new Crust()).topAwC(), ";\n" );
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p ("\n", "--", "\n");
    }
}

