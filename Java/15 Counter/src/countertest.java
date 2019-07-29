import java.util.Arrays;
import java.util.stream.Collectors;

// countertest.java
// Test Counter<T> class
// 2019-07-29   PV

public class countertest {
    public static void main(String[] args) {
        var l1 = Arrays.asList(1, 3, 2, 3, 5, 3, 4, 2, 2, 3, 1, 4, 3, 4, 2, 1, 5, 5 );
        var c1 = new Counter<Integer>(l1);

        System.out.print("c1: ");
        for (var item : c1.MostCommon())
            System.out.printf("%d: %d, ", item.getKey(), item.getValue());
        System.out.println();

        var c2 = new Counter<Character>("anticonstitutionnellement".chars().mapToObj(c -> (char)c).collect(Collectors.toList()));
        System.out.print("c2: ");
        for (var item : c2.MostCommon())
            System.out.printf("%c: %d, ", item.getKey(), item.getValue());
        System.out.println();
    }
}
