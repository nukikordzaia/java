public class Stairs{
    static int countVariants(int stairsCount)
    {
        if (stairsCount == 1)  return 1;
        if (stairsCount == 2) return 2;
        //the way to n step matches the sum of the way to n-1 and n-2, like fibonacci sequence
        //and stairs count matches fibonacci numbers
        return countVariants(stairsCount - 1) + countVariants(stairsCount - 2);
    }
    //testing function in main
    public static void main (String[] args){
        System.out.println("count of variants is "+countVariants(6));
        System.out.println("count of variants is "+countVariants(4));
    }
}
