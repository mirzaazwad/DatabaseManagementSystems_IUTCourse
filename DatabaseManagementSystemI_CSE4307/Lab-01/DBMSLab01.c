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

int FindMax(){
    float maxGPA=-1.00f;
    int maxIx=0;
    for(int i=0;i<g_numberOfRecords2;i++){
        if(nameList2[i].GPA>maxGPA){
            maxGPA=nameList2[i].GPA;
            maxIx=i;
        }
        //printf("%ld %f\n",nameList2[i].studentID,nameList2[i].GPA);
    }
    //printf("%f\n",maxGPA);
    return maxIx;
}

int main(void){
    firstFileRead();
    int maxIx=FindMax();
    printf(" Max GPA Student ID: %ld\n",nameList2[maxIx].studentID);

    return 0;
}
