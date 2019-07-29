import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

// Counter.java
// Java implementation of Counter class
// 2019-07-23   PV

public class Counter<T> {
    private HashMap<T, Integer> map = new HashMap<T, Integer>();

    public Counter() {
    }

    // public Counter(List<T> list) { this(); for (T item : list) Add(item); }
    // public Counter(T array[]) { this(); for (T item : array) Add(item); }

    public Counter(Iterable<T> source) {
        this();
        for (T item : source)
            Add(item);
    }

    public void Add(T item) {
        Add(item, 1);
    }

    private void Add(T item, int count) {
        map.put(item, map.getOrDefault(item, 0) + count);
    }

    public List<Entry<T, Integer>> MostCommon() {
        var l = new ArrayList<Entry<T, Integer>>(map.entrySet());
        Collections.sort(l, (e1, e2) -> e2.getValue() - e1.getValue());
        return l;
    }

    public List<Entry<T, Integer>> MostCommon(int n) {
        return MostCommon().subList(0, n);
    }
}
