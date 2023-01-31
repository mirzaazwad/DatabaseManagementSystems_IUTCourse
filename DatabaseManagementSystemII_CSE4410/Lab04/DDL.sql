drop table Balance;
drop table Transaction;
drop table Account;
drop table AccountProperty;




create table AccountProperty(
  ID number,
  Name varchar2(50),
  ProfitRate number,
  GracePeriod number,
  constraint pk_AccountProperty PRIMARY KEY(ID)
);

create table Account(
  ID number,
  Name varchar2(50),
  AccCode number,
  OpeningDate date,
  LastDateInterest date,
  constraint pk_Account PRIMARY KEY(ID),
  constraint fk_Account_AccountProperty FOREIGN KEY(AccCode) REFERENCES AccountProperty(ID) ON DELETE CASCADE
);



create table Transaction(
  TID number,
  AccNo number,
  Amount number,
  TransactionDate date,
  constraint pk_Transaction PRIMARY KEY(TID),
  constraint fk_Transaction_Account FOREIGN KEY(AccNo) REFERENCES Account(ID) ON DELETE CASCADE
);

create table Balance(
  AccNo number,
  PrincipalAmount number,
  ProfitAmount number,
  constraint pk_Balance PRIMARY KEY(AccNo),
  constraint fk_Balance_Account FOREIGN KEY(AccNo) REFERENCES Account(ID) ON DELETE CASCADE
);

