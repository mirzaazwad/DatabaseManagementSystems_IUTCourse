package CandidateKeyDetermination;

import java.util.ArrayList;
import java.util.List;

public class SubsequenceGenerator {
    public static List<String> getAllSubsequences(String input)
    {
        List<String>answer=new ArrayList<String>();
        answer=printSubsequence(input,"",answer);
        return answer;
    }

    public static List<String> printSubsequence(String input, String output,List<String>subsequences)
    {
        // Base Case
        // if the input is empty print the output string
        if (input.isEmpty()) {
            subsequences.add(output);
            return subsequences;
        }

        // output is passed with including
        // the Ist character of
        // Input string
        printSubsequence(input.substring(1), output + String.valueOf(input.charAt(0)),subsequences);

        // output is passed without
        // including the Ist character
        // of Input string
        return printSubsequence(input.substring(1), output,subsequences);
    }
}
