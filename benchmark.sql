set serveroutput on

DECLARE
  -- T Dale 2008

  c_test_table        CONSTANT VARCHAR2(61) := 'foxmgr.for_testing_please_delete';
  c_tablespace        CONSTANT VARCHAR2(61) := 'tbsdata';
  c_insert_loop_count CONSTANT PLS_INTEGER  := 50000;
  c_fib_number        CONSTANT PLS_INTEGER  := 39;

  l_start      PLS_INTEGER;
  l_current    PLS_INTEGER;
  l_start2     DATE;
  l_db_info    VARCHAR2(4000);
  -----------------------------
  PROCEDURE pl(p_str VARCHAR2) IS BEGIN DBMS_OUTPUT.PUT_LINE(p_str); END;
  -----------------------------
  FUNCTION fib (n POSITIVE) RETURN INTEGER IS
  BEGIN
     IF (n = 1) OR (n = 2) THEN
        RETURN 1;
     ELSE
        RETURN fib(n - 1) + fib(n - 2);
     END IF;
  END fib;
  -----------------------------
  FUNCTION fmt_elapsed( p_from PLS_INTEGER ) RETURN VARCHAR2
  IS
  BEGIN
    RETURN LPAD( TO_CHAR( DBMS_UTILITY.GET_TIME - p_from ), 6,'0' );
  END;
  -----------------------------
  PROCEDURE timing_info
  IS
  BEGIN
    pl('Elapsed hs : '|| fmt_elapsed( l_start ) || ' - Delta hs : ' || fmt_elapsed( l_current ) );
    l_current := DBMS_UTILITY.GET_TIME;
  END;
  -----------------------------
  PROCEDURE insert_recs(p_commit_each_row BOOLEAN)
  IS
    l_msg              VARCHAR2(100)  := 'Insert ' || c_insert_loop_count || ' rows one at a time ';
    c_char    CONSTANT VARCHAR2(1)    := '1';
    c_val_big CONSTANT VARCHAR2(4000) := LPAD(c_char,4000,c_char);
    c_val     CONSTANT VARCHAR2(30)   := LPAD(c_char,30  ,c_char);
  BEGIN
    IF p_commit_each_row THEN l_msg := l_msg || ' COMMIT EVERY ROW'; END IF;
    pl(l_msg);

    FOR i IN 1..c_insert_loop_count LOOP

      EXECUTE IMMEDIATE 'INSERT INTO '||c_test_table||' VALUES(:id,:id2,:id3,:id4 )' USING i,i,c_val,c_val_big;
      IF p_commit_each_row THEN
        COMMIT WRITE WAIT;
      END IF;

    END LOOP;
    timing_info;
  END;
  -----------------------------
  PROCEDURE ex_sql(p_sql VARCHAR2)
  IS
    e_already_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_already_exists, -00955);
  BEGIN
    EXECUTE IMMEDIATE p_sql;
  EXCEPTION
    WHEN e_already_exists THEN
      pl('Obect already exists : ' || p_sql);
  END;
  -----------------------------
  PROCEDURE create_table_and_idx
  IS
  BEGIN
    pl('Create table + idx');
    ex_sql('CREATE TABLE '||c_test_table||'(id int,id2 int, small_text VARCHAR2(30),text VARCHAR2(4000) ) TABLESPACE '||c_tablespace);
    ex_sql('CREATE INDEX '||c_test_table||'idx1 ON '||c_test_table||'(id)          TABLESPACE '||c_tablespace);
    ex_sql('CREATE INDEX '||c_test_table||'idx2 ON '||c_test_table||'(id2) REVERSE TABLESPACE '||c_tablespace);
    ex_sql('CREATE INDEX '||c_test_table||'idx3 ON '||c_test_table||'(small_text)  TABLESPACE '||c_tablespace);
    timing_info;
  END;
  -----------------------------
  PROCEDURE drop_table_and_idx
  IS
  BEGIN
    pl('Drop table + idx');
    ex_sql('DROP TABLE '||c_test_table );
    timing_info;
  END;
  -----------------------------

BEGIN
  pl(CHR(10)||'----------------------------------------');
  SELECT
    'Host : ' || host_name || CHR(10) ||
    'DB   : ' || version   || CHR(10) ||
    'Arch : ' || archiver  || CHR(10)
  INTO l_db_info FROM v$instance;

  pl(l_db_info);

  l_start   := DBMS_UTILITY.GET_TIME;
  l_current := l_start;

  create_table_and_idx;

  insert_recs(FALSE);

  drop_table_and_idx;
  create_table_and_idx;

  insert_recs(TRUE);

  drop_table_and_idx;

  pl(CHR(10) || 'Start - test PLSQL cpu - calc fibinarchi of '|| c_fib_number);
  pl('Fib ' || fib(c_fib_number) );
  timing_info;

  pl('----------------------------------------'||CHR(10));

END;
/