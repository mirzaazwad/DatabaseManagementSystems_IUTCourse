def parseString():
    string="""00128 Zhang Comp. Sci. 102
12345 Shankar Comp. Sci. 32
19991 Brandt History 80
23121 Chavez Finance 110
44553 Peltier Physics 56
45678 Levy Physics 46
54321 Williams Comp. Sci. 5
55739 Sanchez Music 38
70557 Snow Physics 0
76543 Brown Comp. Sci. 58
76653 Aoi Elec. Eng. 60
98765 Bourikas Elec. Eng. 9
98988 Tanaka Biology 120"""
    print("insert into student values(",sep='',end='')
    for i in string:
        if(i==' '):
            print(' , ',end='')
        elif(i=='\n'):
            print(');\n',end='')
            print("insert into student values(",sep='',end='')
        else:
            print(i,sep='',end='')
    print(');\n',end='')
    
            
parseString();