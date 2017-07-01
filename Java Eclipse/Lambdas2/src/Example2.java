// Lambdas Example2
// 2016-10-08   PV

import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Example2 {

    public static void main(String[] args) throws IOException {
        System.out.print("Maximum length of string to include? ");
        BufferedReader console=new BufferedReader(new InputStreamReader(System.in));
        final int maxLength = Integer.parseInt(console.readLine());

        Predicate<String> predicate = new Predicate<String>() {
            @Override
            public boolean match(String item) {
                return item.length()<=maxLength;
            }
        };

        // Old method
        List<String> shortWords = ListUtil.filter(SampleData.WORDS, predicate);
        ListUtil.dump(shortWords);

        // New method, Java 8, although it's unclear how the lambda implements
        // my own Predicate<T> interface and knows it has to provide match method...
        // I guess that since it's because it's an interface with a single bool function
        List<String> shortWords2 = ListUtil.filter(SampleData.WORDS, word -> word.length()<=maxLength);
        ListUtil.dump(shortWords2);
    }

    // Side: Generic syntax
    static <T> T GenFunc(T x)
    {
        return x;
    }
    
    static <T> void GenFunc2(T x)
    {
        
    }

    // generic and wildcard
    public static <T> void copy(List<T> dest, List<? extends T> src) {
        for (T t : src) {
            dest.add(t);
        }
    }
    
    public static <T, S extends T> void copy2(List<T> dest, List<S> src) {
        for (T t : src) {
            dest.add(t);
        }
    }
    
    interface Collection<E> {
        public boolean containsAll(Collection<?> c);
        public boolean addAll(Collection<? extends E> c);
    }
}

