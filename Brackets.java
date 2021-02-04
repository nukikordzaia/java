public class Brackets{
    static public boolean  isProperly(String s) {
        int open = 0;//open bracket
        int close= 0;//close bracket

        for (int i = 0; i < s.length(); ++i) {
            char c = s.charAt(i);
            if (c == '(') {
                ++open;//counts open brackets
            } else if (c == ')') {
                ++close;//counts close brackets
            } else return false;

            if (close > open) return false;
        }

        return close == open;
    }
    public static void main(String [] args)
    {
        System.out.println(isProperly("()()"));
        System.out.println(isProperly("()))()"));
    }
}