package CandidateKeyDetermination;

import java.util.*;
//handles all operations on the dependencies as stored in the table of dependencies generated during input processing
public class DependencyHandler {
    public List<String> dependantAttributes;
    public DependencyHandler(){
        this.dependantAttributes=DependencyHandler.fillDependentAttributes();
    }
    public static Map<String,String>dependencyTable;
    //finds and stores the dependant attributes
    public static List<String> fillDependentAttributes(){
        List<String>dependants=new ArrayList<String>();
        Iterator<Map.Entry<String, String>> dependencyTableIterator = DependencyHandler.dependencyTable.entrySet().iterator();
        while (dependencyTableIterator.hasNext()) {
            Map.Entry<String, String> dependencyTableElement = (Map.Entry<String, String>) dependencyTableIterator.next();
            dependants.add(dependencyTableElement.getValue());
        }
        return getUniqueElementsOfList(dependants);
    }
    //basically a necessary utility function that helps filter elements to return only unique elements in the set
    public static List<String> getUniqueElementsOfList(List<String>elements)
    {
        SortedSet<String> sortedSet=new TreeSet<String>();
        List<String>result=new ArrayList<String>();
        for(String element:elements){
            for(int j=0;j<element.length();j++){
                sortedSet.add(String.valueOf(element.charAt(j)));
            }
        }
        for(String s:sortedSet){
            result.add(s);
        }
        return result;
    }
    //Gets A for A->B when B is known
    public List<Pair<String,String>>getDependeeFromDependant(List<String>input)
    {
        List<Pair<String,String>>dependee=new ArrayList<Pair<String,String>>();
        List<String>dependants=new ArrayList<String>();
        Iterator<Map.Entry<String, String>> dependencyTableIterator = DependencyHandler.dependencyTable.entrySet().iterator();
        while (dependencyTableIterator.hasNext()) {
            Map.Entry<String, String> dependencyTableElement = (Map.Entry<String, String>) dependencyTableIterator.next();
            for(String dummy_input:input)//the loop deals with transitivity
            {
                if(dependencyTableElement.getValue().contains(dummy_input)){
                    Pair<String,String>pair=new Pair<String,String>(dummy_input,dependencyTableElement.getKey());
                    dependee.add(pair);
                }
            }
        }
        return dependee;
    }
}
