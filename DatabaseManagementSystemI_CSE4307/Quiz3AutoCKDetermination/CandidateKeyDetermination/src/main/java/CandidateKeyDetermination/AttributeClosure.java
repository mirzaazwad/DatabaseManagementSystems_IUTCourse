package CandidateKeyDetermination;

import java.util.*;
//gives the attribute closure and the attribute closure of all the attributes being termed as closureAllAttributes
public class AttributeClosure {
    private String closureAllAttributes;
    private String attributeClosure;
    private List<String> attributes;

    public AttributeClosure(String input){
        this.attributeClosure=this.findAttributeClosure(input,"");
    }
    public static String AllAttributeSuperKey(List<String>attributes){
        String s="";
        for(String attribute:attributes){
            s+=attribute;
        }
        return s;
    }

    public String getAttributeClosure(){
        return this.attributeClosure;
    }

    private String findAttributeClosure(String input,String currentResult){
        List<String>allSubStrings= SubsequenceGenerator.getAllSubsequences(input);
        SortedSet<Character> sortedSet=transitivityProperty(input);
        sortedSet=findAllCompoundDependencies(allSubStrings,sortedSet);
        String result=AttributeClosure.getUniqueElementsAsString(sortedSet);
        if(!input.equals(result))return this.findAttributeClosure(result,result);
        else return result;
    }
    //helps deal with the transitive dependency edge cases while attempting to find the candidate key
    private SortedSet<Character> transitivityProperty(String input){
        SortedSet<Character> sortedSet=new TreeSet<Character>();
        for(int i=0;i<input.length();i++)
        {
            sortedSet.add(input.charAt(i));
        }
        return sortedSet;
    }

    private SortedSet<Character>findAllCompoundDependencies(List<String>allSubStrings,SortedSet<Character>sortedSet){
        for(String s:allSubStrings){
            if(DependencyHandler.dependencyTable.containsKey(s)){
                String dependencyFound=DependencyHandler.dependencyTable.get(s);
                for(int i=0;i<dependencyFound.length();i++){
                    sortedSet.add(dependencyFound.charAt(i));
                }
            }
            else{
                for(int i=0;i<s.length();i++){
                    sortedSet.add(s.charAt(i));
                }
            }
        }
        return sortedSet;
    }

    public static<T> String getUniqueElementsAsString(Set<T>input)
    {
        String result="";
        for(T c:input)
        {
            result=result+String.valueOf(c);
        }
        return result;
    }


}
