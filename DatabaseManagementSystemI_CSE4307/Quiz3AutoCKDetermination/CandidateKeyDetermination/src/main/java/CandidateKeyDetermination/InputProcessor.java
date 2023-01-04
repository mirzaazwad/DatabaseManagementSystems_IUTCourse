package CandidateKeyDetermination;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
//this class processes the input file and accordingly makes a table of dependencies from the dependency information provided
public class InputProcessor {
    private String fileName;
    private String fileContents;
    private String attributes;
    public InputProcessor(String fileName){
        this.fileName=fileName;
        fileContents="";
        DependencyHandler.dependencyTable= new HashMap<String,String>();
        this.readFile();
        this.processString();
    }

    private void readFile(){
        try{
            FileReader fileReader=new FileReader(this.fileName);
            Character character;
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
            this.fileContents=this.fileContents.replace("\n", "").replace("\r", "").trim();
        }
        catch(FileNotFoundException e){
               System.out.println("File not found, please input the file path properly");
               e.printStackTrace();
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

    public String getFileContents(){
        return this.fileContents;
    }

    public void processString(){
        //the newlines and trailing and leading spaces were removed while reading the file and storing as string
        int attributeDefinitionEnd=this.fileContents.indexOf(')');
        this.attributes=this.fileContents.substring(0,attributeDefinitionEnd+1);//the +1 is for inclusive split
        String dependencies=this.fileContents.substring(attributeDefinitionEnd+1);
        String[] terms=dependencies.split(",");
        for(String term:terms){
            String[] dependency=term.split("->");
            DependencyHandler.dependencyTable.put(dependency[0].trim(),dependency[1].trim());
        }
    }

    public List<String> getAttributes(){
        List<String>attributeList=new ArrayList<String>();
        String[] unfilteredAttributes=this.attributes.split(",");
        for(String attribute: unfilteredAttributes){
            if(attribute.contains("(")){
                attributeList.add(attribute.split("\\(")[1].trim());
            }
            else if(attribute.contains(")")){
                attributeList.add(attribute.split("\\)")[0].trim());
            }
            else{
                attributeList.add(attribute);
            }
        }
        return attributeList;
    }

}
