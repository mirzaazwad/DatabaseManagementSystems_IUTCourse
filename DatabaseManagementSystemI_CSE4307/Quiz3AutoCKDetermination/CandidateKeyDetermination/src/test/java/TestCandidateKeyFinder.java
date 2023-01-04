import CandidateKeyDetermination.*;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

public class TestCandidateKeyFinder {
    @Test
    public void testMotherClouse(){//tests whether all attribute superkey gives the attribute closure containing all attributes
        InputProcessor inputProcessor=new InputProcessor("input.txt");
        CandiateKeyFinder ckFinder=new CandiateKeyFinder(inputProcessor.getAttributes());
        assertEquals(new AttributeClosure("ABCD").getAttributeClosure(),"ABCD");
    }

    @Test
    public void testAttributeClosure(){//tests whether the attribute closure for attributes works properly
        InputProcessor inputProcessor=new InputProcessor("input.txt");
        CandiateKeyFinder ckFinder=new CandiateKeyFinder(inputProcessor.getAttributes());
        assertEquals(new AttributeClosure("D").getAttributeClosure(),"ABCD");
    }

    @Test
    public void testIsCandidateKey()
    {//tests whether D is a candidate key for the example given in the question
        InputProcessor inputProcessor=new InputProcessor("input.txt");
        CandiateKeyFinder ckFinder=new CandiateKeyFinder(inputProcessor.getAttributes());
        assertTrue(new CandidateKeyTest(ckFinder.getAttributes()).isCandidateKey("D"));
    }

    @Test
    public void testACandidateKey(){
        //test whether the first candidate key found is a valid one
        InputProcessor inputProcessor=new InputProcessor("input.txt");
        CandiateKeyFinder ckFinder=new CandiateKeyFinder(inputProcessor.getAttributes());
        assertTrue(new CandidateKeyTest(ckFinder.getAttributes()).isCandidateKey(ckFinder.getACandidateKey()));
    }


    @Test
    public void testAllCA(){
        //test if all the candidate keys can be obtained by the program
        InputProcessor inputProcessor=new InputProcessor("input.txt");
        CandiateKeyFinder ckFinder=new CandiateKeyFinder(inputProcessor.getAttributes());
        Set<String> CK=ckFinder.getAllCandidateKeys();
        for(String s:CK)
        {
            assertTrue(new CandidateKeyTest(ckFinder.getAttributes()).isCandidateKey(s));
        }
    }

    @Test
    public void testSubsequenceGenerator(){
        List<String>subsequences=new ArrayList<String>();
        subsequences= SubsequenceGenerator.printSubsequence("ABCD","",subsequences);
        for(String s:subsequences)
        {
            System.out.println(s);
        }
    }

}
