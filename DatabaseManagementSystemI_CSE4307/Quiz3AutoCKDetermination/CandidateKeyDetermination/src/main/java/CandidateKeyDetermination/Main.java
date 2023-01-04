package CandidateKeyDetermination;
//Author: Mirza Mohammad Azwad
//Student ID: 200042121
//Github Link: https://github.com/mirzaazwad/CSE4307_DatabaseManagementSystem/tree/main/Quiz3AutomatedCandidateKeyDetermination
public class Main {
    public static void main(String[] args)
    {
        CandidateKey ck=new CandidateKey("input.txt");
        ck.outputCandidateKeys("output.txt");
    }
}
