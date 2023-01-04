package CandidateKeyDetermination;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Set;
//this class acts as a sort of factory class and essentially produces the appropriate output as per the question
//basically an output producer
public class CandidateKey {
    private Set<String> candidateKeys;
    public CandidateKey(String filename){
        InputProcessor input=new InputProcessor(filename);
        CandiateKeyFinder ckFinder=new CandiateKeyFinder(input.getAttributes());
        this.candidateKeys=ckFinder.getAllCandidateKeys();
    }
    public void outputCandidateKeys(String filename)
    {
        FileWriter fw;
        try{
            fw=new FileWriter(filename);
            WriteFileHeader(fw,this.candidateKeys.size());
            int index=1;
            for(String s:this.candidateKeys)
            {
                fw.write(String.format("CK%d: %s\n",index++,s));
            }
            fw.close();

        }
        catch (IOException e)
        {
            System.out.println("Write Failed due to\n");
            e.printStackTrace();
        }
    }

    public void WriteFileHeader(FileWriter fw,Integer numberOfCandidateKeys) throws IOException
    {
        if(numberOfCandidateKeys>1)
        {
            fw.write(String.format("There are a total of %d possible CKs. They are given below:\n",numberOfCandidateKeys));
        }
        else{
            fw.write(String.format("There is only %d possible CK. They are given below:\n",numberOfCandidateKeys));
        }
    }
}
