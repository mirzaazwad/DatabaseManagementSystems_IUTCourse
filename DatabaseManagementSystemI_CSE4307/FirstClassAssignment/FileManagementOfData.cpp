//2 files contain employee data
//first file contains name,address and bloodGroup
//second file contains name,address and salary
//take is to retrieve data from the 2 files and store them in a third file that contains a combined information from both files
//then retrieve data for those with a blood group of B+ve and store them in another file

#include<stdio.h>
#include<string.h>
#include<stdbool.h>
#include<stdlib.h>
#define NAME_LEN 50
#define ADDRESS_LEN 500
#define BLOODGROUP_LEN 10
#define SALARY_LEN 100
#define INFO1_LEN 560
#define INFO2_LEN 650
#define NUMBEROFRECORDSMAX 1000005

typedef struct information1{
    char name[NAME_LEN];
    char address[ADDRESS_LEN];
    char bloodGroup[BLOODGROUP_LEN];
}Info1;

typedef struct information2{
    char name[NAME_LEN];
    char address[ADDRESS_LEN];
    int salary;
}Info2;

Info1 nameList1[NUMBEROFRECORDSMAX+1];
Info2 nameList2[NUMBEROFRECORDSMAX+1];


int g_numberOfRecords=0;
int g_numberOfRecords2=0;
bool readError=false;
bool writeError=false;
//(freopen("E:\\Competitive Programming Training\\file1.txt","r",stdin)

void firstFileRead(){
    FILE* fp;
    fp=fopen("E:\\Competitive Programming Training\\file1.txt","r");
    if(fp==NULL){
        printf("Error in opening input file");
        readError=true;
        return;
    }
    else{
       char a;
       char temp[NAME_LEN+ADDRESS_LEN+BLOODGROUP_LEN];
       char name[NAME_LEN];
       bool nameFound=false;
       char address[ADDRESS_LEN];
       bool addressFound=false;
       char bloodGroup[BLOODGROUP_LEN];
       bool bgFound=false;
       
       while(fscanf(fp,"%s",temp)!=EOF){
        char name[NAME_LEN];
        bool nameFound=false;
        char address[ADDRESS_LEN];
        bool addressFound=false;
        char bloodGroup[BLOODGROUP_LEN];
        memset(name,'\0',sizeof(name));
        memset(address,'\0',sizeof(address));
        memset(bloodGroup,'\0',sizeof(bloodGroup));
        bool bgFound=false;
        int j=0;
        int i=0;
        while(temp[j]!=','){
            name[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!=','){
            address[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(i<=3){
            bloodGroup[i]=temp[j];
            i++;
            j++;
        }
        memcpy(nameList1[g_numberOfRecords].name,name,sizeof(name));
        memcpy(nameList1[g_numberOfRecords].address,address,sizeof(address));
        memcpy(nameList1[g_numberOfRecords++].bloodGroup,bloodGroup,sizeof(bloodGroup));
       }
    }
    fclose(fp);
}

void secondFileRead(){
    FILE* fp=fopen("E:\\Competitive Programming Training\\file2.txt", "r");
    if(fp==NULL){
        printf("Error in opening input file");
        readError=true;
        return;
    }
    else{
       char a;
       char temp[NAME_LEN+ADDRESS_LEN+SALARY_LEN];
       char name[NAME_LEN];
       bool nameFound=false;
       char address[ADDRESS_LEN];
       bool addressFound=false;
       char salary[SALARY_LEN];
       bool bgFound=false;
       
       while(fscanf(fp,"%s",temp)!=EOF){
        char name[NAME_LEN];
        bool nameFound=false;
        char address[ADDRESS_LEN];
        bool addressFound=false;
        char salary[SALARY_LEN];
        memset(name,'\0',sizeof(name));
        memset(address,'\0',sizeof(address));
        memset(salary,'\0',sizeof(salary));
        bool bgFound=false;
        int j=0;
        int i=0;
        while(temp[j]!=','){
            name[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!=','){
            address[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        int Salary=0;
        while(temp[j]!='\0'){
            salary[i]=temp[j];
            if(salary[i]>='0' && salary[i]<='9'){
                Salary=Salary*10+(salary[i]-'0');
            }
            i++;
            j++;
        }
        
        memcpy(nameList2[g_numberOfRecords2].name,name,sizeof(name));
        memcpy(nameList2[g_numberOfRecords2].address,address,sizeof(address));
        nameList2[g_numberOfRecords2++].salary=Salary;
       }


    }
    fclose(fp);
}

void outputFileWriteTask1(){
    FILE* fp=fopen("E:\\Competitive Programming Training\\file3.txt", "w");
    if(fp==NULL){
        printf("Error in opening input file");
        readError=true;
        return;
    }
    else{
        for(int i=0;i<g_numberOfRecords;i++){
            for(int j=0;j<g_numberOfRecords2;j++){
                if(!memcmp(nameList1[i].name,nameList2[j].name,sizeof(nameList1[i].name))){
                    fprintf(fp,"%s\t%s\t%s\t%d\n",nameList1[i].name,nameList1[i].address,nameList1[i].bloodGroup,nameList2[j].salary);
                }
            }
        }
    }
    fclose(fp);
}

void outputFileWriteTask2(){
    FILE* fp=fopen("E:\\Competitive Programming Training\\file4.txt", "w");
    if(fp==NULL){
        printf("Error in opening input file");
        readError=true;
        return;
    }
    else{
        for(int i=0;i<g_numberOfRecords;i++){
            for(int j=0;j<g_numberOfRecords2;j++){
                if(!memcmp(nameList1[i].name,nameList2[j].name,sizeof(nameList1[i].name)) && !memcmp(nameList1[i].bloodGroup,"B+ve",sizeof(nameList1[i].bloodGroup))){
                    fprintf(fp,"%s\t%s\t%s\t%d\n",nameList1[i].name,nameList1[i].address,nameList1[i].bloodGroup,nameList2[j].salary);
                }
            }
        }
    }
    fclose(fp);

}


int main(void){
    firstFileRead();
    secondFileRead();
    outputFileWriteTask1();
    outputFileWriteTask2();
    
    return 0;
}
