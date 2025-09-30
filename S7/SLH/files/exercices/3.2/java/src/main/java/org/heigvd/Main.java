package org.heigvd;


import java.util.Arrays;

public class Main {
    
    private static String reverse(String str)
    {
        char[] charArray = new char[str.length()];

        for(int i = 0; i < str.length(); i++)
        {
            charArray[i] = str.charAt(str.length() - 1 - i);
        }

        return Arrays.toString(charArray);

    }
    
    public static void main(String[] args) {

        String str = "Hello World!";

        System.out.println("Content:     " + str);
        System.out.println("Content rev: " + reverse(str));

    }
}