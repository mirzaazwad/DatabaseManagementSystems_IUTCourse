import CandidateKeyDetermination.CandidateKey;
import org.junit.jupiter.api.Test;

import java.io.FileReader;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertEquals;
//test cases obtained from the slide
public class TestCandidateKey {
    @Test
    public void Test_Case_1() throws IOException {
        CandidateKey candidateKey=new CandidateKey("TestCases/input1.txt");
        candidateKey.outputCandidateKeys("TestCases/output1.txt");
        FileReader fileReader=new FileReader("TestCases/output1.txt");
        Character character;
        String fileContents="";
        character=(char)fileReader.read();
        while(true){
            fileContents+=character;
            int temp=fileReader.read();
            if(temp==-1){
                break;
            }
            else{
                character=(char)temp;
            }
        }
        assertEquals("There is only 1 possible CK. They are given below:\n" +
                "CK1: D\n",fileContents);
    }

    @Test
    public void Test_Case_2() throws IOException{
        CandidateKey candidateKey=new CandidateKey("TestCases/input2.txt");
        candidateKey.outputCandidateKeys("TestCases/output2.txt");
        FileReader fileReader=new FileReader("TestCases/output2.txt");
        Character character;
        String fileContents="";
        character=(char)fileReader.read();
        while(true){
            fileContents+=character;
            int temp=fileReader.read();
            if(temp==-1){
                break;
            }
            else{
                character=(char)temp;
            }
        }
        assertEquals("There are a total of 3 possible CKs. They are given below:\n" +
                "CK1: AD\n" +
                "CK2: BD\n" +
                "CK3: CD\n",fileContents);
    }

    @Test
    public void Test_Case_3() throws IOException{
        CandidateKey candidateKey=new CandidateKey("TestCases/input3.txt");
        candidateKey.outputCandidateKeys("TestCases/output3.txt");
        FileReader fileReader=new FileReader("TestCases/output3.txt");
        Character character;
        String fileContents="";
        character=(char)fileReader.read();
        while(true){
            fileContents+=character;
            int temp=fileReader.read();
            if(temp==-1){
                break;
            }
            else{
                character=(char)temp;
            }
        }
        assertEquals("There is only 1 possible CK. They are given below:\n" +
                "CK1: ACD\n",fileContents);
    }

    @Test
    public void Test_Case_4() throws IOException{
        CandidateKey candidateKey=new CandidateKey("TestCases/input4.txt");
        candidateKey.outputCandidateKeys("TestCases/output4.txt");
        FileReader fileReader=new FileReader("TestCases/output4.txt");
        Character character;
        String fileContents="";
        character=(char)fileReader.read();
        while(true){
            fileContents+=character;
            int temp=fileReader.read();
            if(temp==-1){
                break;
            }
            else{
                character=(char)temp;
            }
        }
        assertEquals("There are a total of 4 possible CKs. They are given below:\n" +
                "CK1: AB\n" +
                "CK2: AD\n" +
                "CK3: CB\n" +
                "CK4: CD\n",fileContents);
    }

    @Test
    public void Test_Case_5() throws IOException{
        CandidateKey candidateKey=new CandidateKey("TestCases/input5.txt");
        candidateKey.outputCandidateKeys("TestCases/output5.txt");
        FileReader fileReader=new FileReader("TestCases/output5.txt");
        Character character;
        String fileContents="";
        character=(char)fileReader.read();
        while(true){
            fileContents+=character;
            int temp=fileReader.read();
            if(temp==-1){
                break;
            }
            else{
                character=(char)temp;
            }
        }
        System.out.println(fileContents);
        assertEquals("There is only 1 possible CK. They are given below:\n" +
                "CK1: AC\n",fileContents);
    }

}
