public class Coins{

    static int minSplit(int amount){
        int quantity=0;//number of coins
        int x=amount/50;//x is number of coins used
        int y=amount-(50*x);//y is remaining amount
        quantity+=x;
        x=y/20;
        y=y-20*x;
        quantity+=x;
        x=y/10;
        y=y-10*x;
        quantity+=x;
        x=y/5;
        y=y-5*x;
        quantity+=x;
        x=y/1;
        y=y-1*x;
        quantity+=x;
        return quantity;

    }
    //testing function in main
    public static void main(String[] args)
    {

        System.out.println("Minimum coins required is "+minSplit(51));
        System.out.println("Minimum coins required is "+minSplit(77));
    }
}