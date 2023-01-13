SELECT tablespace_name,file_id , bytes/1024 KB
FROM dba_free_space
WHERE tablespace_name ='TBS1';
SELECT tablespace_name,file_id , bytes/1024 KB
FROM dba_free_space
WHERE tablespace_name ='TBS2';