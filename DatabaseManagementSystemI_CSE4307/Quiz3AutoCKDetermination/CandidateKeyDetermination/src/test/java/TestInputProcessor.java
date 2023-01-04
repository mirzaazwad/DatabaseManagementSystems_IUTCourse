import CandidateKeyDetermination.DependencyHandler;
import CandidateKeyDetermination.InputProcessor;
import org.junit.jupiter.api.Test;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

public class TestInputProcessor {
    @Test
    public void testInputString(){//test if file read occurs properly
        InputProcessor input=new InputProcessor("input.txt");
        assertEquals(input.getFileContents(),"R(A,B,C,D)A->B, B->C, D->A");
        //In windows, line seperator in txt files is \r\n while in UNIX based systems its just \n
    }

    public String outputProcessedString(Map<String,String> dependencyTable){
        String output="";
        Iterator<Map.Entry<String, String>> dependencyTableIterator = dependencyTable.entrySet().iterator();
        while (dependencyTableIterator.hasNext()) {
            Map.Entry<String, String> dependencyTableElement = (Map.Entry<String, String>) dependencyTableIterator.next();
            output=output+dependencyTableElement.getKey() + " -> "+ dependencyTableElement.getValue()+"\n";
        }
        return output;
    }

    @Test
    public void testTableProcessing(){//test if the read file can be processed into a table properly
        InputProcessor input=new InputProcessor("input.txt");
        assertEquals(outputProcessedString(DependencyHandler.dependencyTable),"A -> B\n" +
                "B -> C\n" +
                "D -> A\n");
    }

    public String outputAttributes(List<String> attributeList){
        String output="";
        for(String s:attributeList)
        {
            output=output+s+",";
        }
        output=output.substring(0,output.length()-1);
        return output;
    }

    @Test
    public void testAttributeList()//tests if all attributes can be identified from the read file contents
    {
        InputProcessor inputProcessor=new InputProcessor("input.txt");
        assertEquals(outputAttributes(inputProcessor.getAttributes()),"A,B,C,D");
    }
}
