// -*- mode: java; buffer-read-only: t -*-

class IsVegetarianV {
    boolean forSkewer () {
        return true;
    }
    boolean forOnion (ShishD s) {
        return s.isVegetarian();
    }
    boolean forLamb (ShishD s) {
        return false;
    }
    boolean forTomato (ShishD s) {
        return s.isVegetarian();
    }
}

class OnlyOnionsV {
    boolean forSkewer() {
        return true;
    }
    boolean forOnion(ShishD s) {
        return s.onlyOnions();
    }
    boolean forLamb(ShishD s) {
        return false;
    }
    boolean forTomato(ShishD s) {
        return false;
    }
}

abstract class ShishD {
    OnlyOnionsV oofn = new OnlyOnionsV();
    IsVegetarianV ivfn = new IsVegetarianV();
    abstract boolean onlyOnions();
    abstract boolean isVegetarian();
}
class Skewer extends ShishD {
    boolean onlyOnions () {
        return oofn.forSkewer();
    }
    boolean isVegetarian () {
        return ivfn.forSkewer();
    }
}
class Onion extends ShishD {
    ShishD s;
    Onion(ShishD _s) {
        s = _s;
    }
    // ----------------------------------------
    boolean onlyOnions () {
        return oofn.forOnion(s);
    }
    boolean isVegetarian () {
        return ivfn.forOnion(s);
    }
}
class Lamb extends ShishD {
    ShishD s;
    Lamb(ShishD _s) {
        s = _s;
    }
    // ----------------------------------------
    boolean onlyOnions () {
        return oofn.forLamb(s);
    }
    boolean isVegetarian () {
        return ivfn.forLamb(s);
    }
}
class Tomato extends ShishD {
    ShishD s;
    Tomato(ShishD _s) {
        s = _s;
    }
    // ----------------------------------------
    boolean onlyOnions () {
        return oofn.forLamb(s);
    }
    boolean isVegetarian () {
        return ivfn.forTomato(s);
    }
}

class RemAV {
    PizzaD forCrust() {
        return new Crust();
    }
    PizzaD forCheese(PizzaD p) {
        return new Cheese(p.remA());
    }
    PizzaD forOlive(PizzaD p) {
        return new Olive(p.remA());
    }
    PizzaD forAnchovy(PizzaD p) {
        return p.remA();
    }
    PizzaD forSausage(PizzaD p) {
        return new Sausage(p.remA());
    }
}
class TopAwCV {
    PizzaD forCrust() {
        return new Crust();
    }
    PizzaD forCheese(PizzaD p) {
        return new Cheese(p.topAwC());
    }
    PizzaD forOlive(PizzaD p) {
        return new Olive(p.topAwC());
    }
    PizzaD forAnchovy(PizzaD p) {
        return
            new Cheese
            (new Anchovy
             (p.topAwC()));
    }    
    PizzaD forSausage(PizzaD p) {
        return new Sausage(p.topAwC());
    }
}
class SubAbCV {
    PizzaD forCrust() {
        return new Crust();
    }
    PizzaD forAnchovy(PizzaD p) {
        return new Cheese(p.subAbC());
    }
    PizzaD forSausage(PizzaD p) {
        return new Sausage(p.subAbC());
    }
    PizzaD forOlive(PizzaD p) {
        return new Olive(p.subAbC());
    }
    PizzaD forCheese(PizzaD p) {
        return new Cheese(p.subAbC());
    }
}

abstract class PizzaD {
    RemAV remfn = new RemAV();
    TopAwCV topfn = new TopAwCV();
    SubAbCV subfn = new SubAbCV();
    abstract PizzaD remA();
    abstract PizzaD topAwC();
    abstract PizzaD subAbC();
};
class Crust extends PizzaD {
    PizzaD remA() { return remfn.forCrust(); }
    PizzaD topAwC() { return topfn.forCrust(); }
    PizzaD subAbC() { return subfn.forCrust(); }
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
    PizzaD remA() { return remfn.forCheese(p); }
    PizzaD topAwC() { return topfn.forCheese(p); }
    PizzaD subAbC() { return subfn.forCheese(p); }
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
    PizzaD remA() { return remfn.forOlive(p); }
    PizzaD topAwC() { return topfn.forOlive(p); }
    PizzaD subAbC() { return subfn.forOlive(p); }
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
    PizzaD remA() { return remfn.forAnchovy(p); }
    PizzaD topAwC() { return topfn.forAnchovy(p); }
    PizzaD subAbC() { return subfn.forAnchovy(p); }
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
    PizzaD remA() { return remfn.forSausage(p); }
    PizzaD topAwC() { return topfn.forSausage(p); }
    PizzaD subAbC() { return subfn.forSausage(p); }
    public String toString() {
        return String.format("Sausage %s", p);
    }
}

class Test {
    static void p(Object... objs) {
        for(Object o:objs) {
            System.out.printf("%s ", o);
        }
    }
    static private void test1() {
        ShishD s1 = new Skewer();
        ShishD s2 = new Onion(s1);
        ShishD s3 = new Onion(s2);
        ShishD s4 = new Lamb(s3);
        ShishD s5 = new Lamb(s4);
        ShishD s6 = new Tomato(s5);
        p(s6.isVegetarian());
        p(s3.isVegetarian());
        p(s3.onlyOnions());
        p(s6.onlyOnions());
    }
    static private void test2() {
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p("\n", "---test2", "\n");
        test2();
        p ("\n", "--", "\n");
    }
}
