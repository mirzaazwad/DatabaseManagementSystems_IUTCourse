package CandidateKeyDetermination;

import java.util.ArrayList;
import java.util.List;

public class AttributeSetOperations {
    public List<String>primeAttributes;
    public List<String>dependantAttributes;
    public AttributeSetOperations(){
        this.primeAttributes=new ArrayList<String>();
        this.dependantAttributes=DependencyHandler.fillDependentAttributes();
    }
    //Deals with the intersection condition upon update of Primary Attributes which aids in the replacement process
    public Integer fixPSSIntersectsDA(Pair<String,String>dependee){
        for(int i=0;i<dependee.second.length();i++)
        {
            if(!primeAttributes.contains(String.valueOf(dependee.second.charAt(i)))){
                primeAttributes.add(String.valueOf(dependee.second.charAt(i)));
            }
        }
        for(int i=0;i<dependee.first.length();i++)
        {
            if(dependantAttributes.contains(String.valueOf(dependee.first.charAt(i)))){
                dependantAttributes.remove(String.valueOf(dependee.first.charAt(i)));
            }
        }
        return 0;//reset index of currentPositionInCandidateKey
    }
    //finds the intersection between primary attributes and dependant attributes
    public List<String> findIntersection()
    {
        List<String>intersection=new ArrayList<String>();
        for(String PA:primeAttributes)
        {
            if(dependantAttributes.contains(PA)){
                intersection.add(PA);
            }
        }
        return intersection;
    }
}
