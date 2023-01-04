#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>


#define NAME_LEN 10
#define BG_LEN 10
#define DEPT_LEN 10
#define NUMBEROFRECORDSMAX 1000005

typedef struct information1{
    char name[NAME_LEN];
    long studentID;
    long age;
    char department[DEPT_LEN];
    char bloodGroup[BG_LEN];
}Info1;

typedef struct information2{
    long studentID;
    float GPA;
    int semester;
}Info2;

Info1 nameList1[NUMBEROFRECORDSMAX+1];
Info2 nameList2[NUMBEROFRECORDSMAX+1];

int g_numberOfRecords=0;
int g_numberOfRecords2=0;
bool readError=false;
bool writeError=false;

void firstFileRead(){
    FILE* fp;
    fp=fopen("D:\\Lab-01\\grades.txt","r");
    if(fp==NULL){
        printf("Error in opening input file");
        readError=true;
        return;
    }
    else{
       char a;
       char temp[15+5+10];
       while(fscanf(fp,"%s",temp)!=EOF){
        char studentID[15];
        char GPA[5];
        char semester[10];
        long StudentID;
        int Semester;
        float gpa;
        memset(studentID,'\0',sizeof(studentID));
        memset(GPA,'\0',sizeof(GPA));
        memset(semester,'\0',sizeof(semester));
        int j=0;
        int i=0;
        while(temp[j]!=';'){
            studentID[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!=';'){
            GPA[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!='\0'){
            semester[i]=temp[j];
            i++;
            j++;
        }
        sscanf(studentID,"%ld",&StudentID);
        sscanf(GPA,"%f",&gpa);
        sscanf(semester,"%d",&Semester);
        nameList2[g_numberOfRecords2].studentID=StudentID;
        nameList2[g_numberOfRecords2].GPA=gpa;
        nameList2[g_numberOfRecords2++].semester=Semester;
       }
    }
    fclose(fp);
}

void secondFileRead(){
    FILE* fp;
    fp=fopen("D:\\Lab-01\\studentinfo.txt","r");
    if(fp==NULL){
        printf("Error in opening input file");
        readError=true;
        return;
    }
    else{
       char a;
       char temp[15+5+10];
       while(fscanf(fp,"%s",temp)!=EOF){
        char studentID[15];
        char name[10];
        char age[15];
        char bloodGroup[10];
        char department[10];
        long StudentID;
        long Age;
       
        memset(studentID,'\0',sizeof(studentID));
        memset(name,'\0',sizeof(name));
        memset(bloodGroup,'\0',sizeof(bloodGroup));
        memset(age,'\0',sizeof(age));
        memset(department,'\0',sizeof(department));
        int j=0;
        int i=0;
        while(temp[j]!=';'){
            studentID[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!=';'){
            name[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!=';'){
            age[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!=';'){
            bloodGroup[i]=temp[j];
            i++;
            j++;
        }
        i=0;
        j++;
        while(temp[j]!='\0'){
            department[i]=temp[j];
            i++;
            j++;
        }
        sscanf(studentID,"%ld",&nameList1[g_numberOfRecords].studentID);
        sscanf(name,"%s",nameList1[g_numberOfRecords].name);
        sscanf(age,"%ld",&nameList1[g_numberOfRecords].age);
        sscanf(bloodGroup,"%s",nameList1[g_numberOfRecords].bloodGroup);
        sscanf(department,"%s",nameList1[g_numberOfRecords++].department);
       }
    }
    fclose(fp);
}

void writeValidatedGrade(){
    FILE* fp=fopen("D:\\Lab-01\\grades.txt", "a");
    if(fp==NULL){
        printf("Error in opening input file");
        writeError=true;
        return;
    }
    else{
        long studentID;
        float gpa;
        int semester;
        scanf("%ld %f %d",&studentID,&gpa,&semester);
        bool found=false;
        for(int i=0;i<g_numberOfRecords;i++){
            if(studentID==nameList1[i].studentID){
                found=true;
            }
        }
        if(!found){
            printf("Student ID not found");
            return;
        }
        if(gpa<2.50f || gpa>4.00f){
            printf("GPA is out of range");
            return;
        }
        if(semester<1 || semester>8){
            printf("semester out of range");
            return;
        }
        for(int i=0;i<g_numberOfRecords2;i++){
            if(studentID==nameList2[i].studentID && nameList2[i].semester==semester){
                puts("GPA for semester already exists");
                return;
            }
        }
        fprintf(fp,"%ld %f %d\n",studentID,gpa,semester);

    }
    fclose(fp);
}

int main(void){
    firstFileRead();
    secondFileRead();
    writeValidatedGrade();
    

    return 0;
}