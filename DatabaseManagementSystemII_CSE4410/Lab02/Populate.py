
def student(): #For Student Data
    for i in range(50):
        print("INSERT INTO student VALUES('",i+1, "',' ","a"*(i+1)," ','41');")
    for i in range(50):
        print("INSERT INTO student VALUES('",i+1+50, "',' ","b"*(i+1+50)," ','11');")
    for i in range(50):
        print("INSERT INTO student VALUES('",i+1+100, "',' ","c"*(i+1+100)," ','21');")
    for i in range(50):
        print("INSERT INTO student VALUES('",i+1+150, "',' ","d"*(i+1+150)," ','31');")
    for i in range(50):
        print("INSERT INTO student VALUES('",i+1+200, "',' ","e"*(i+1+200)," ','51');")

def courses(): #Courses Data
    for i in range(50):
        print("INSERT INTO courses VALUES('",i+1, "',' ",4.00," ','41');")
    for i in range(50):
        print("INSERT INTO courses VALUES('",i+1+50, "',' ",4.00," ','11');")
    for i in range(50):
        print("INSERT INTO courses VALUES('",i+1+100, "',' ",4.00," ','21');")
    for i in range(50):
        print("INSERT INTO courses VALUES('",i+1+150, "',' ",4.00," ','31');")
    for i in range(50):
        print("INSERT INTO courses VALUES('",i+1+200, "',' ",4.00," ','51');")
  