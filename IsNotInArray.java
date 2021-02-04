import java.util.Arrays;
public class IsNotInArray
{
    static int notContains(int[] array){
        Arrays.sort(array);//sorting array
        int a=1;//the smallest integer
        for(int i=0; i<array.length; i++)
        {
            if(a!=array[i])//checks if the smallest integer is in array,if its not returns a
            {
                return a;

            }
            a++;

        }
        return a;

    }
    //testing function in main
    public static void main(String[] args)
    {
        int [] array = new int [] {1,22,3,2,4,5,32};
        System.out.println(notContains(array));

    }
} 