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
  Account_id varchar2(150),
  Name varchar2(50),
  AccCode number,
  OpeningDate date,
  LastDateInterest date,
  constraint pk_Account PRIMARY KEY(Account_id),
  constraint fk_Account_AccountProperty FOREIGN KEY(AccCode) REFERENCES AccountProperty(ID) ON DELETE CASCADE
);



create table Transaction(
  TID number,
  AccNo varchar2(150),
  Amount number,
  TransactionDate date,
  constraint pk_Transaction PRIMARY KEY(TID),
  constraint fk_Transaction_Account FOREIGN KEY(AccNo) REFERENCES Account(Account_id) ON DELETE CASCADE
);

create table Balance(
  AccNo varchar2(150),
  PrincipalAmount number,
  ProfitAmount number,
  constraint pk_Balance PRIMARY KEY(AccNo),
  constraint fk_Balance_Account FOREIGN KEY(AccNo) REFERENCES Account(Account_id) ON DELETE CASCADE
);

