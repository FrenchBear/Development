// Iterator
// Implementation of an iterable object
//
// 2015-08-07   PV      Inspired by my Permutator class

package iter;

import java.util.Iterator;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayDeque;
import java.util.Deque;

public class TestIterator {
    static String Axiom = "X";
    static Map<String, String> Rules;
    static int Depth = 3;

    static {
        Rules = new HashMap<String, String>();
        Rules.put("X", "-YF+XFX+FY-");
        Rules.put("Y", "+XF-YFY-FX+");
    }

    public static void main(String[] args) {
        System.out.println("Hello world!");

        String s1 = getStackExpanded(Depth, Axiom, Rules);
        System.out.println(s1);

        LSystemIterator lsi = new LSystemIterator(Depth, Axiom, Rules);
        for (String s2 : lsi)
            System.out.print(s2);
        System.out.println();
    }

    private static String getStackExpanded(int depth, String axiom, Map<String, String> rules) {
        Deque<DepthAxiom> stack = new ArrayDeque<DepthAxiom>();
        stack.add(new DepthAxiom(depth, axiom));

        StringBuilder res = new StringBuilder();
        while (stack.peekLast() != null) {
            DepthAxiom c = stack.pollLast();
            if (c.d == 0)
                res.append(c.a);
            else {
                if (rules.containsKey(c.a)) {
                    String r = rules.get(c.a);
                    for (int i = r.length() - 1; i >= 0; i--)
                        stack.add(new DepthAxiom(c.d - 1, r.substring(i, i + 1)));
                } else
                    stack.add(new DepthAxiom(0, c.a));
            }
        }
        return res.toString();
    }
}

class DepthAxiom {
    int d;
    String a;

    public DepthAxiom(int depth, String axiom) {
        d = depth;
        a = axiom;
    }
}

class LSystemIterator implements Iterable<String> {
    Map<String, String> rules;
    Deque<DepthAxiom> stack;

    public LSystemIterator(int depth, String axiom, Map<String, String> rules) {
        this.rules = rules;
        stack = new ArrayDeque<DepthAxiom>();
        stack.add(new DepthAxiom(depth, axiom));
    }

    @Override
    public Iterator<String> iterator() {
        Iterator<String> it = new Iterator<String>() {

            @Override
            public boolean hasNext() {
                return !stack.isEmpty();
            }

            @Override
            public String next() {
                while (stack.peekLast() != null) {
                    DepthAxiom c = stack.pollLast();
                    if (c.d == 0)
                        return c.a;
                    if (rules.containsKey(c.a)) {
                        String r = rules.get(c.a);
                        for (int i = r.length() - 1; i >= 0; i--)
                            stack.add(new DepthAxiom(c.d - 1, r.substring(i, i + 1)));
                    } else
                        stack.add(new DepthAxiom(0, c.a));
                }
                return "?"; // Just to avoid a compilation error
            }

            @Override
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
        return it;
    }
}
