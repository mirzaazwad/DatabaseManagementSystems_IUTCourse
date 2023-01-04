package CandidateKeyDetermination;

import java.util.List;
import java.util.Set;

public class CandidateKeyTest {
    private List<String>attributes;
    public CandidateKeyTest(List<String>attributes)
    {
        this.attributes=attributes;
    }
    public boolean isCandidateKey(String input){
        AttributeClosure attributeClosureInput=new AttributeClosure(input);
        if(!attributeClosureInput.getAttributeClosure().equals(AttributeClosure.AllAttributeSuperKey(this.attributes))){
            return false;
        }
        List<String> subStrings= SubsequenceGenerator.getAllSubsequences(input);
        for(String s:subStrings)
        {
            AttributeClosure attributeClosureS=new AttributeClosure(s);
            if(attributeClosureS.getAttributeClosure().equals(AttributeClosure.AllAttributeSuperKey(this.attributes)) && !s.equals(input))
            {
                return false;
            }
        }
        return true;
    }

    public String CheckProperSubset(String input)
    {
        if(isCandidateKey(input))
        {
            return input;
        }
        else{
            List<String>subStrings= SubsequenceGenerator.getAllSubsequences(input);
            for(String s:subStrings)
            {
                if(isCandidateKey(s))
                {
                    return s;
                }
                else{
                    continue;
                }
            }
        }
        return input;
    }

    public static int findLargestCKSize(Set<String> current)
    {
        int max=0;
        for(String s:current)
        {
            if(s.length()>max)max=s.length();
        }
        return max;
    }
}
