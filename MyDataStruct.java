import java.util.*;
public class MyDataStruct
{
    // A resizable array 
    ArrayList<Integer> arr;

    // A hash where keys are array elements and values are
// indexes in arr[] 
    HashMap<Integer, Integer> hash;

    // Constructor (creates arr[] and hash)
    public MyDataStruct()
    {
        arr = new ArrayList<Integer>();
        hash = new HashMap<Integer, Integer>();
    }

    // A O(1) function to add an element to MyDataStruct
// data structure 
    void add(int x)
    {

// If element is already present, then noting to do
        if (hash.get(x) != null)
            return;

// Else put element at the end of arr[] 
        int s = arr.size();
        arr.add(x);

// And put in hash also 
        hash.put(x, s);
    }

    // A O(1) function to remove an element from MyDataStruct
// data structure 
    void remove(int x)
    {

// Check if element is in hashtable
        Integer index = hash.get(x);
        if (index == null)
            return;

// If element is in hastabe, then remove element from hash 
        hash.remove(x);

// Swap element with last element so that remove from 
// arr[] can be done in O(1) time 
        int size = arr.size();
        Integer last = arr.get(size-1);
        Collections.swap(arr, index,  size-1);

// Remove last element (This is O(1)) 
        arr.remove(size-1);

// Update hash table for new index of last element 
        hash.put(last, index);
    }
    // Returns index of element if it is not returns null
    Integer search(int x)
    {
        return hash.get(x);
    }


// testing 


    public static void main (String[] args)
    {
        MyDataStruct DS = new MyDataStruct();
        DS.add(2);
        DS.add(7);
        DS.add(9);
        DS.add(6);
        DS.add(21);
        System.out.println(DS.search(6));
        DS.remove(6);
        DS.remove(2);
        System.out.println(DS.search(2));

    }
}
