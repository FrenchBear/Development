// Stack-based permutator
// Java version is a bit more compact and faster than C#...
// 2015-05-22   PV

import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class Permutator<Type> implements Iterable<List<Type>> {

    private Stack<ListLevel<Type>> stack;   // Stack to store elements not fully permuted

    public Permutator(List<Type> newList) {
        stack = new Stack<ListLevel<Type>>();
        // 1st ListLevel, 0 item has been permuted yet
        ListLevel<Type> ll = new ListLevel<Type>();
        ll.list = newList;
        ll.level = 0;
        stack.push(ll);
    }

    // One element of the stack, with level items at the head of the list already permuted
    private class ListLevel<Z> {
        public List<Z> list;
        public int level;
    }

    @Override
    public Iterator<List<Type>> iterator() {
        Iterator<List<Type>> it = new Iterator<List<Type>>() {

            @Override
            public boolean hasNext() {
                return !stack.isEmpty();
            }

            @Override
            public List<Type> next() {
                for (; ; )
                {
                    // Take the top of the stack
                    ListLevel<Type> x = stack.pop();
                    
                    // If all the elements of the list have been permuted, the element is valid and can be returned
                    if (x.level == x.list.size() - 1)
                        return x.list;

                    // Take one by one all remaining elements not permuted in the list, and push
                    // a list with this element added to the list of already permuted elements, remaining one
                    // less element in the non-permuted part
                    for (int i = x.list.size() - 1; i >= x.level; i--)
                    {
                        Type element = x.list.get(i);
                        List<Type> copy = new ArrayList<Type>(x.list);
                        copy.remove(i);
                        copy.add(x.level, element);
                        // Push the list with one more permuted element on the stack
                        ListLevel<Type> ll = new ListLevel<Type>();
                        ll.list = copy;
                        ll.level = x.level+1;
                        stack.push(ll);
                    }
                }
            }

            @Override
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
        return it;
    }
}
