


class Test {
    static void p(Object... objs) {
        for(Object o:objs)
            System.out.printf("%s ", o);
    }
    static private void test1() {
    }
    static public void main(String[] args) {
        p("\n", "---test1", "\n");
        test1();
        p ("\n", "--", "\n");
    }
}

