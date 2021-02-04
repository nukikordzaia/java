public class Palindrome {
    //function isPalindrome cheks if text is palindrome
    static Boolean isPalindrome(String text)
    {
        String str="";//empty string
        for(int i = text.length()-1; i >= 0; i--)
        {
            str = str +text.charAt(i);//Adds the last symbol to an empty string(reverses text)
        }
        if(text.equals(str))//checks if reversed string and text is same
            return true;
        else
            return false;
    }

    //testing function in main
    public static void main(String args[])
    {
        System.out.println("this text is palindrome?  "+isPalindrome("hahah"));
        System.out.println("this text is palindrome?  "+isPalindrome("p"));
        System.out.println("this text is palindrome?  "+isPalindrome("hello"));
    }
}
