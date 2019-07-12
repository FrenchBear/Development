import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.DoubleStream;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import java.util.regex.Pattern;

// streams.java
// Play with Java8 Stream<T> class
// 2019-07-05   PV

public class streams {
    public static void main(String[] args) {
        User u1 = new User(1, "Pierre", true);
        User u2 = new User(2, "Claude", true);
        User u3 = new User(3, "Sophie", false);
        User u4 = new User(4, "Denise", false);

        List<User> lu = Arrays.asList(u1, u2, u3, u4); // immutable
        Set<User> su = new HashSet<User>();
        su.add(u1);
        su.add(u2);
        su.add(u3);
        su.add(u4);

        // Create a stream
        Stream<String> streamEmpty = Stream.empty();
        Stream<User> su1 = lu.stream();
        Stream<User> su2 = su.stream();

        Stream<String> ss2 = Stream.<String>builder().add("Once").add("upon").add("a").add("time").build();
        Stream<String> ss3 = Stream.generate(() -> "string").limit(10);
        Stream<String> ss4 = Pattern.compile(", ").splitAsStream("a, b, c");

        Stream<Integer> si1 = Stream.iterate(10, n -> n + 2).limit(20);
        Stream<Integer> si2 = Stream.iterate(10, n -> n < 100, n -> n + 2);

        // Stream of primitives (int)
        TestIntStream();

        // Stream of primitives (double)
        Random rnd = new Random();
        DoubleStream ds1 = rnd.doubles(10);

        IntStream si3 = "Pierre".chars();

    }

    private static void TestIntStream() {
        System.out.println("TestIntStream");
        IntStream is = IntStream.range(1, 10); // 1..9
        is = IntStream.rangeClosed(1, 10); // 1..10
        System.out.println(is);
        // int sum = is.sum();
        // long cnt = is.count();
        OptionalDouble avg = is.average();
        is = IntStream.of(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5);
        is.distinct().forEach(n -> System.out.print(n));
        System.out.println();

        var sumSquares = IntStream.range(1, 10).map(n -> n * n).sum();
        var sumOddSquares = IntStream.range(1, 10).filter(n -> (n & 1) != 0).map(n -> n * n).sum();

        String s = IntStream.range(1, 10).mapToObj(n -> Integer.toString(n)).collect(Collectors.joining(", ", "[", "]"));
        System.out.println(s);  // [1, 2, 3, 4, 5, 6, 7, 8, 9]

        int ti[] = IntStream.range(1, 10).toArray();
        List<Integer> li = IntStream.range(1, 10).mapToObj(n -> n).collect(Collectors.toList());

        var stats = IntStream.range(1, 10).mapToObj(n -> n).collect(Collectors.summarizingInt(n -> n));
        System.out.print(stats);    // IntSummaryStatistics{count=9, sum=45, min=1, average=5,000000, max=9}

        // Split range in 4 lists depending on n%3
        Map<Integer,List<Integer>> mi = IntStream.range(1, 10).mapToObj(n -> n).collect(Collectors.groupingBy(n -> n%3));

    }
}
