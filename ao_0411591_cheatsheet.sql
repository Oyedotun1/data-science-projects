-- COMP-1701 (258748) Transforming Data Into Databases

/*
** Name: Abdulmalik Oyedotun
** Date: 2024_09_04
** Comp: A
** File: ao_0411591_cheatsheet.sql
** Hist ：
**
-- -------------------------------------------------------------------
2024-09-04 MySQL Configuration
           - Install/Reinstall Information
		   - Service: Description / Path to Executable
		   - my ini: configuration files and descriptions

2024-09-18 DROP/CREATE/USE block for boxstore DATABASE
			- ran USE sys to get out of boxstore, if in it
			- DROP/CREATE/USE of the boxstore database
			- using compliant UTF-8 Encoding (utf8mb4/_unicode_ci)
			
2024-09-20 Data Types
		   - Booleans
		   - Integer and Numeric
		   - Strings: CHAR, VARCHAR, TEXT
		   - DATE: DATE, DATETIME, TIME, TIMESTAMP
		   
2024-10-04  Created people TABLE
            - DROP/CREATE-TRUNCATE/INSERT/SELECT
            - Documented the load data command to Import 10k people
             CSV file

2024-10-28  Altered people TABLE to add more columns
            - UPDATE/ALTER/JOIN
			- Encrypting passwords
			- Parsing Strings
            - Entity Relationship Diagram
			- Cardinalities
			- Draw.IO
			
-- Messaging via Email or Meeting Booking in Teams:
	COMP-1701 (258748)
**
*/



-- -------------------------------------------------------------------
-- Cheatsheet name
ao_0411591_cheatsheet.sql

-- Services > MariaDB_11.5 (mysqld.exe)
-- Specifies the MariaDB service name and executable.

-- INSTDIR (INSTALLDIR)
C:\Program Files\MariaDB 11.5\
-- Installation directory where MariaDB is installed.

-- BINDIR
C:\Program Files\MariaDB 11.5\bin\
-- Directory containing executable binaries for MariaDB.

-- MySQL Background Service (mysqld.exe):
-- Details about the background service executable.

-- DATADIR
C:\_data\MariaDB_11.5\data\
-- Directory where MariaDB stores its data files.

-- .ini FILE (my.ini Configuration/Setting File)
C:\_data\MariaDB_11.5\data\my.ini
-- Path to the MySQL configuration file.

-- SERVICE NAME
MariaDB_11.5
-- The name of the MariaDB service.

-- Backup my.ini file first to, use:
-- my_YYYY_MM_DD_HHMM.bak.ini
-- my_2024_09_04_ini
-- Instructions to back up the configuration file before
-- making changes.

-- Service mysql path to Executable
"C:\Program Files\MariaDB 11.5\bin\mysqld.exe" 
"--defaults-file=C:\_data\MariaDB_11.5\data\my.ini" "MariaDB_11.5"
-- Command to start the MariaDB service with specified configuration.

-- -------------------------------------------------------------------

-- To connect to SQL from PowerShell/CMD
-- Command to initiate a connection to the MariaDB server
-- using the root user.
mysql -u root -p

-- Example output after successful connection:
PS C:\WINDOWS\system32> mysql -u root -p
Enter password: ****
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 31
Server version: 11.5.2-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input
statement.

-- -------------------------------------------------------------------
-- Comments  /* */ vs. --(Space) vs. # 
-- Different styles of comments in SQL.
-- Single Line comment, recommended format:
-- Use '--' followed by a space for single-line comments.
-- This ensures comments do not interfere with SQL commands.
-- -------------------------------------------------------------------

-- Listing of databases with different functions 
-- Database navigation Commands
-- Example command to show all databases.
SHOW DATABASES;

-- Example output of SHOW DATABASES command:
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.003 sec)

MariaDB [(none)]>

-- USE Commands Syntax:
-- Command to select and use a specific database.
USE database_name;

-- Working example:
USE information_schema;

-- Example output after using a database:
MariaDB [(none)]> USE information_schema;
Database changed
MariaDB [information_schema] >

-- Verify the currently selected database using SELECT DATABASE():
-- Command to display the name of the current database.
SELECT DATABASE();

-- Example output of SELECT DATABASE():
MariaDB [information_schema]> SELECT DATABASE();
+--------------------+
| DATABASE()         |
+--------------------+
| information_schema |
+--------------------+
1 row in set (0.000 sec)

-- Working on SHOW TABLES; Command
-- Command to list all tables within the selected database.
MariaDB [information_schema]> SHOW TABLES;

-- Example output of SHOW TABLES:
+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| ALL_PLUGINS                           |
| APPLICABLE_ROLES                      |
| CHARACTER_SETS                        |
| CHECK_CONSTRAINTS                     |
| COLLATIONS                            |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLUMNS                               |
| COLUMN_PRIVILEGES                     |
| ENABLED_ROLES                         |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| GLOBAL_STATUS                         |
| GLOBAL_VARIABLES                      |
| KEYWORDS                              |
| KEY_CACHES                            |
| KEY_COLUMN_USAGE                      |
| KEY_PERIOD_USAGE                      |
| OPTIMIZER_COSTS                       |
| OPTIMIZER_TRACE                       |
| PARAMETERS                            |
| PARTITIONS                            |
| PERIODS                               |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| ROUTINES                              |
| SCHEMATA                              |
| SCHEMA_PRIVILEGES                     |
| SEQUENCES                             |
| SESSION_STATUS                        |
| SESSION_VARIABLES                     |
| STATISTICS                            |
| SQL_FUNCTIONS                         |
| SYSTEM_VARIABLES                      |
| TABLES                                |
| TABLESPACES                           |
| TABLE_CONSTRAINTS                     |
| TABLE_PRIVILEGES                      |
| TRIGGERS                              |
| USERS                                 |
| USER_PRIVILEGES                       |
| VIEWS                                 |
| CLIENT_STATISTICS                     |
| INDEX_STATISTICS                      |
| INNODB_FT_CONFIG                      |
| GEOMETRY_COLUMNS                      |
| INNODB_SYS_TABLESTATS                 |
| SPATIAL_REF_SYS                       |
| USER_STATISTICS                       |
| INNODB_TRX                            |
| INNODB_CMP_PER_INDEX                  |
| INNODB_METRICS                        |
| INNODB_FT_DELETED                     |
| INNODB_CMP                            |
| THREAD_POOL_WAITS                     |
| INNODB_CMP_RESET                      |
| THREAD_POOL_QUEUES                    |
| TABLE_STATISTICS                      |
| INNODB_SYS_FIELDS                     |
| INNODB_BUFFER_PAGE_LRU                |
| INNODB_LOCKS                          |
| INNODB_FT_INDEX_TABLE                 |
| INNODB_CMPMEM                         |
| THREAD_POOL_GROUPS                    |
| INNODB_CMP_PER_INDEX_RESET            |
| INNODB_SYS_FOREIGN_COLS               |
| INNODB_FT_INDEX_CACHE                 |
| INNODB_BUFFER_POOL_STATS              |
| INNODB_FT_BEING_DELETED               |
| INNODB_SYS_FOREIGN                    |
| INNODB_CMPMEM_RESET                   |
| INNODB_FT_DEFAULT_STOPWORD            |
| INNODB_SYS_TABLES                     |
| INNODB_SYS_COLUMNS                    |
| INNODB_SYS_TABLESPACES                |
| INNODB_SYS_INDEXES                    |
| INNODB_BUFFER_PAGE                    |
| INNODB_SYS_VIRTUAL                    |
| user_variables                        |
| INNODB_TABLESPACES_ENCRYPTION         |
| INNODB_LOCK_WAITS                     |
| THREAD_POOL_STATS                     |
+---------------------------------------+
84 rows in set (0.002 sec)

MariaDB [information_schema]>

-- DESCRIBE collations working example
-- Command to describe the structure of the 'collations' table.
MariaDB [information_schema]> DESCRIBE collations;

-- Example output of DESCRIBE collations:
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| COLLATION_NAME     | varchar(64) | NO   |     | NULL    |       |
| CHARACTER_SET_NAME | varchar(32) | YES  |     | NULL    |       |
| ID                 | bigint(11)  | YES  |     | NULL    |       |
| IS_DEFAULT         | varchar(3)  | YES  |     | NULL    |       |
| IS_COMPILED        | varchar(3)  | NO   |     | NULL    |       |
| SORTLEN            | bigint(3)   | NO   |     | NULL    |       |
+--------------------+-------------+------+-----+---------+-------+
6 rows in set (0.019 sec)

MariaDB [information_schema]>

DESCRIBE collations;

-- SELECT query example, and try to read it
-- working example
SELECT collation_name, character_set_name
FROM   collations
WHERE  character_set_name = 'utf8mb4'
ORDER BY character_set_name, collation_name;

-- Example output of the SELECT query:
MariaDB [information_schema]> 
        SELECT collation_name, character_set_name
     -> FROM collations
     -> WHERE character_set_name='utf8mb4'
     -> ORDER BY collation_name;
+------------------------------+--------------------+
| collation_name               | character_set_name |
+------------------------------+--------------------+
| utf8mb4_bin                  | utf8mb4            |
...
| utf8mb4_general_ci           | utf8mb4            |
| utf8mb4_general_nopad_ci     | utf8mb4            |
| utf8mb4_german2_ci           | utf8mb4            |
...
| utf8mb4_swedish_ci           | utf8mb4            |
| utf8mb4_thai_520_w2          | utf8mb4            |
| utf8mb4_turkish_ci           | utf8mb4            |
| utf8mb4_unicode_520_ci       | utf8mb4            |
| utf8mb4_unicode_520_nopad_ci | utf8mb4            |
| utf8mb4_unicode_ci           | utf8mb4            |
| utf8mb4_unicode_nopad_ci     | utf8mb4            |
| utf8mb4_vietnamese_ci        | utf8mb4            |
+------------------------------+--------------------+
34 rows in set (0.004 sec)

-- First database to set our collation 
'utf8mb4_unicode_ci'

-- -------------------------------------------------------------------
-- CREATE DATABASE replacing database_name with your database name
CREATE DATABASE IF NOT EXISTS ao_0411591_boxstore
CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';
-- This command creates a new database named
-- 'ao_0411591_boxstore' if it does not already exist.
-- It sets the default character set to 'utf8mb4'
-- and the default collation to 'utf8mb4_unicode_ci'.

-- Example output after CREATE DATABASE:
MariaDB [information_schema]> CREATE DATABASE IF NOT EXISTS ao_0411591_boxstore
    -> CHARSET='utf8mb4'
    -> COLLATE='utf8mb4_unicode_ci';
	Query OK, 1 row affected (0.001 sec)
-- Once the query is completed, use the newly created database:
USE ao_0411591_boxstore;

-- Example output after USE command:
MariaDB [information_schema]> USE ao_0411591_boxstore;
Database changed
MariaDB [ao_0411591_boxstore]>

-- -------------------------------------------------------------------
-- SELECT QUERY Syntax
-- General syntax for a SELECT statement:
SELECT   column1, column2, ..., columnN 
FROM     table_view_subquery_temp_result_set 
WHERE    filter_condition
ORDER BY column1, column2; 
-- 
-- Explanation:
-- SELECT: Specifies the columns to retrieve.
-- FROM: Specifies the table, view, subquery, or
-- temporary result set to retrieve data from.
-- WHERE: Filters the rows based on specified conditions.
-- ORDER BY: Sorts the result set based on one or more columns.

-- SELECT query example, and try to read it
-- working example with descriptions for each clause
-- SELECT   - description of selected columns
-- FROM     - description of source table
-- WHERE    - description of filter condition
-- ORDER BY - description of sorting order
SELECT collation_name, character_set_name
FROM   collations
WHERE  character_set_name = 'utf8mb4'
ORDER BY character_set_name, collation_name;

-- Another SELECT example without WHERE clause
SELECT collation_name, character_set_name
FROM collations;

-- -------------------------------------------------------------------
-- Data Types

-- BIT/BOOLEAN is actually a TINYINT(1) or
-- INT(1) only accepting 0 or 1 (FALSE or TRUE)
-- as values.
-- Demonstrates BOOLEAN behavior using SELECT statement.
SELECT FALSE AS b0, TRUE AS b1;
-- Explanation:
-- FALSE is represented as 0.
-- TRUE is represented as 1.
-- 'b0' and 'b1' are aliases (labels) for the resulting columns.
-- The result set will display:
-- +----+----+
-- | b0 | b1 |
-- +----+----+
-- |  0 |  1 |
-- +----+----+

-- Using the temp result set as a subquery
-- in the FROM to perform conditionals in the SELECT
--
SELECT trs.b0, trs.b1
     , trs.b0 = trs.b1 AS b0_eq_b1
     , trs.b0 <> trs.b1 AS b0_neq_b1
     , trs.b0 != trs.b1 AS b0_not_eq_b1
     , trs.b0 = trs.b0 AS b0_eq_b0
     , trs.b1 = TRUE AS b1_is_true
FROM (SELECT FALSE AS b0, TRUE AS b1) trs;
-- Explanation:
-- The subquery `(SELECT FALSE AS b0, TRUE AS b1)`
-- creates a temporary result set with two columns: b0 (0) and b1 (1).
-- 'trs' is a table alias for the temporary result set.
-- The main SELECT statement performs various comparisons:
-- - b0_eq_b1: Checks if b0 equals b1 (0 = 1) -> 0 (FALSE)
-- - b0_neq_b1: Checks if b0 is not equal to b1 (0 <> 1) -> 1 (TRUE)
-- - b0_not_eq_b1: Another way to check inequality (0 != 1) -> 1 (TRUE)
-- - b0_eq_b0: Checks if b0 equals itself (0 = 0) -> 1 (TRUE)
-- - b1_is_true: Checks if b1 is TRUE (1 = TRUE) -> 1 (TRUE)

-- INTEGER and NUMERIC(s,p)
-- Demonstrates INTEGER and DECIMAL data types using SELECT statements.

-- Basic integer and decimal values with aliases.
SELECT 1 AS i1, 2 AS i2
     , 1.0 AS d1, 2.22 AS d2;
-- Explanation:
-- i1: Integer value 1
-- i2: Integer value 2
-- d1: Decimal value 1.0
-- d2: Decimal value 2.22
-- The result set will display:
-- +----+----+-----+------+
-- | i1 | i2 | d1  | d2   |
-- +----+----+-----+------+
-- |  1 |  2 | 1.0 | 2.22 |
-- +----+----+-----+------+

-- Using the above SELECT as a temporary result
-- set to perform comparisons and operations.
SELECT i1, i2, d1, d2 -- returns: 1, 2, 1.0, 2.22
     , i1 < i2    AS i1_less_i2       -- 1 < 2 -> 1 (TRUE)
     , i1 <= d1   AS i1_less_eq_d1    -- 1 <= 1.0 -> 1 (TRUE)
     , i1 = d1    AS i1_eq_d1         -- 1 = 1.0 -> 1 (TRUE)
     , i1 != d1   AS i1_not_eq_d1     -- 1 != 1.0 -> 0 (FALSE)
     , i2 > i1    AS i2_greater_i1    -- 2 > 1 -> 1 (TRUE)
     , d2 >= i2   AS d2_greater_eq_i2 -- 2.22 >= 2 -> 1 (TRUE)
     , 1.5 BETWEEN i1 AND d2 AS between_1_5 
	 -- 1 <= 1.5 <= 2.22 -> 1 (TRUE)
     , 2.22 BETWEEN i1 AND d2 AS between_2_22 
	 -- 1 <= 2.22 <= 2.22 -> 1 (TRUE)
     , 3 BETWEEN i1 AND d2 AS between_3     
	 -- 1 <= 3 <= 2.22 -> 0 (FALSE)
FROM (SELECT 1 AS i1, 2 AS i2
           , 1.0 AS d1, 2.22 AS d2) trs2;
-- Explanation:
-- Each expression in the SELECT clause
-- evaluates to either 1 (TRUE) or 0 (FALSE) based on the comparison.
-- 'trs2' is the alias for the temporary result set.

-- Detailed explanation of comparison operators:
-- =  is equal to
-- <  is less than
-- <= is less than or equal to
-- >  is greater than
-- >= is greater than or equal to
-- != and <> are not equal to

-- Demonstrating the BETWEEN operator:
-- value BETWEEN begin_value AND end_value
-- Compares whether the value is within and/or
-- equals the begin and end values.
-- Equivalent to: value >= begin_value AND value <= end_value

SELECT i1, d2
  , 1.5 BETWEEN i1 AND d2 AS between_1_5
  , i1 <= 1.5 AND 1.5 <= d2 AS equivalent_condition
FROM (SELECT 1 AS i1, 2 AS i2
           , 1.0 AS d1, 2.22 AS d2) trs3;
-- Explanation:
-- Shows that '1.5 BETWEEN i1 AND d2' is equivalent to 'i1 <= 1.5 AND 1.5 <= d2'.
-- Both expressions evaluate to 1 (TRUE) for 1.5
-- and demonstrate the logical equivalence.

-- Demonstrating the IN operator:
-- column IN (value1, value2, ..., valueN)
-- returns 1 (TRUE) if the column value matches any value in the list.

SELECT i1 IN (1,2,3,4) AS i1_in_list      -- TRUE (1)
     , i2 IN (5,6,7,8) AS i2_in_list      -- FALSE (0)
     , d1 IN (1,2,3,4) AS d1_in_list      -- TRUE (1)
     , d2 IN (i1,i2,d1) AS d2_in_list     -- FALSE (0)
FROM (SELECT 1 AS i1, 2 AS i2
           , 1.0 AS d1, 2.22 AS d2) trs4;
-- Explanation:
-- i1 = 1 is in the list (1,2,3,4) -> TRUE
-- i2 = 2 is not in the list (5,6,7,8) -> FALSE
-- d1 = 1.0 is in the list (1,2,3,4) -> TRUE
-- d2 = 2.22 is not in the list (1,2,1.0) -> FALSE

-- Performing mathematical operations with numbers:
-- Demonstrates basic arithmetic operations:
-- addition, subtraction, multiplication, division, and modulus.

SELECT i1 + i2 AS addition, 
       i1 - i2 AS subtraction, 
       i1 * i2 AS multiplication, 
       i1 / i2 AS division, 
       i1 % i2 AS modulus
     , d1 + d2 AS d_addition, 
       d1 - d2 AS d_subtraction, 
       d1 * d2 AS d_multiplication, 
       d1 / d2 AS d_division, 
       d1 % d2 AS d_modulus
     , i1 + d1 AS i1_plus_d1, 
       i1 - d1 AS i1_minus_d1, 
       i1 * d1 AS i1_times_d1, 
       i1 / d1 AS i1_div_d1, 
       i1 % d1 AS i1_mod_d1
FROM (SELECT 1 AS i1, 2 AS i2
           , 1.0 AS d1, 2.22 AS d2) trs5;
-- Explanation:
-- Performs arithmetic operations between integers
-- (i1, i2) and decimals (d1, d2).
-- The result set will show the outcome
-- of each operation with appropriate aliases.

-- Summary of Arithmetic Operators:
-- + : Addition
-- - : Subtraction
-- * : Multiplication
-- / : Division
-- % : Modulus (returns the remainder)

-- Strings: CHAR(s) - VARCHAR(s) - TEXT

-- VARCHAR(S): for variable length cell data.
-- Example function to get the length of a VARCHAR string.
-- CHAR_LENGTH(string_variable)

-- When analyzing fields, perform Google searches
-- to understand appropriate data types.

-- MAX_LENGTH AND Variable LENGTH Expected:
-- Example guideline:
-- Max was 10 characters, smallest 5 characters, 50% from Max
-- Use these metrics to determine appropriate VARCHAR sizes.

-- IF GLOBAL DATA:
VARCHAR(85)
-- Example of specifying a VARCHAR with a maximum
-- length of 85 characters.

-- -------------------------------------------------------------------

-- Examples of VARCHAR with different lengths
VARCHAR(5), VARCHAR(10), ..., VARCHAR(15)
-- Demonstrates defining VARCHAR columns with varying maximum lengths.

-- • Maximum length for the utf8mb4 charset is VARCHAR(191),
-- because indexes for MySQL are limited to 768 bytes,
-- and 768 / 4 = 192 (approx). Therefore, VARCHAR(191) is safest.
-- Maximum size to use:
VARCHAR(191)

-- CHAR(S) should be used for constant width data:
-- Examples:
-- Postal code typically has a fixed length.
-- CHAR(7) or CHAR(6) ensures all entries have the same length.
CHAR(10) -- Example: 'Hello     ' (padded with spaces)
CHAR(5)  -- Example: 'Hello'

-- Working examples for CHAR and VARCHAR

-- Simple strings with leading and trailing spaces.
-- Note: Data is usually trimmed and not stored with these spaces.
SELECT ' Hi ' AS s1
     , ' Bye ' AS s2;
-- Explanation:
-- Demonstrates that strings can have spaces at the beginning and end.
-- However, in practice, such spaces are often trimmed before storage.

-- -------------------------------------------------------------------
-- Demonstrates various string functions using a temporary result set
SELECT s1, s2            -- Original strings: ' Hi ' and ' Bye '
  , TRIM(s1), TRIM(s2)   -- Removes leading and trailing spaces:
--  'Hi', 'Bye'
  , LTRIM(s1), LTRIM(s2) -- Removes leading spaces: 'Hi ', 'Bye '
  , RTRIM(s1), RTRIM(s2) -- Removes trailing spaces: ' Hi', ' Bye'
  , CONCAT(s1,'and',s2)  -- Concatenates strings without spaces:
--  ' Hiand Bye '
  , LENGTH(TRIM(s1)), LENGTH('HĬ') -- LENGTH returns the length in bytes
  , CHAR_LENGTH(TRIM(s1)), CHAR_LENGTH('HĬ') 
  -- CHAR_LENGTH returns the number of characters
FROM (SELECT ' Hi '  AS s1
           , ' Bye ' AS s2) tsr6;
-- Explanation:
-- - TRIM removes both leading and trailing spaces.
-- - LTRIM removes only leading spaces.
-- - RTRIM removes only trailing spaces.
-- - CONCAT combines multiple strings into one.
-- - LENGTH measures the byte length, which can differ
-- from character length for multibyte characters.
-- - CHAR_LENGTH measures the actual number of characters.

-- Usually, strings stored in the database are
-- trimmed to remove unnecessary spaces.
-- When using CONCAT, it's important to account for spaces if needed.

SELECT s1, s2               -- Original strings: 'Hi' and 'Bye'
    , CONCAT(s1,' and ',s2) -- Concatenates with spaces: 'Hi and Bye'
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr7;
-- Explanation:
-- This example demonstrates proper concatenation by
-- including spaces within the CONCAT function.

-- String Comparisons and Pattern Matching
SELECT s1, s2       -- Original strings: 'Hi' and 'Bye'
  , s1 = s2, s1 <> s2   -- Comparisons: 0 (FALSE), 1 (TRUE)
  , s1 = 'Hi'         -- Checks if s1 equals 'Hi': 1 (TRUE)
  , s1 <> 'Bye'       -- Checks if s1 is not equal to 'Bye': 1 (TRUE)
  , s1 LIKE 'H%'      -- Checks if s1 starts with 'H': 1 (TRUE)
  , s1 LIKE 'H_'      
  -- Checks if s1 is 'H' followed by exactly one character: 1 (TRUE)
  , 'H' LIKE 'H%'     -- Checks if 'H' matches pattern 'H%': 1 (TRUE)
  , 'Hi' LIKE 'H%'    -- Checks if 'Hi' matches pattern 'H%': 1 (TRUE)
  , ' Hi' LIKE 'H%'   -- Checks if ' Hi' matches pattern 'H%': 0 (FALSE)
  , 'H' LIKE 'H_'     -- Checks if 'H' matches pattern 'H_': 0 (FALSE)
  , s1 LIKE 'H__'     
  -- Checks if s1 has 'H' followed by any two characters: 0 (FALSE)
  , s1 LIKE '_i'      
  -- Checks if s1 has any one character followed by 'i': 1 (TRUE)
  , s1 LIKE '__i'     
  -- Checks if s1 has any two characters followed by 'i': 0 (FALSE)
  , s1 LIKE '%i'      
  -- Checks if s1 ends with 'i': 1 (TRUE)
  , s1 LIKE '%%i'     
  -- Checks if s1 ends with 'i' (redundant): 1 (TRUE)
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr8;
-- Explanation:
-- - '=' and '<>' are used for exact string comparisons.
-- - 'LIKE' is used for pattern matching:
--   - '%' represents zero or more characters.
--   - '_' represents exactly one character.
-- - Patterns must account for exact string formats, including spaces.

-- More String Comparisons and Patterns
SELECT s1, s2       -- Original strings: 'Hi' and 'Bye'
  , s2 = 'Bye'        -- Checks if s2 equals 'Bye': 1 (TRUE)
  , s2 != 'Hi'        -- Checks if s2 is not equal to 'Hi': 1 (TRUE)
  , s2 LIKE 'B%'      -- Checks if s2 starts with 'B': 1 (TRUE)
  , s2 LIKE 'B_'      
  -- Checks if s2 is 'B' followed by exactly one character: 0 (FALSE)
  , 'B' LIKE 'B%'     -- Checks if 'B' matches pattern 'B%': 1 (TRUE)
  , 'Bye' LIKE 'B%'   -- Checks if 'Bye' matches pattern 'B%': 1 (TRUE)
  , ' Bye' LIKE 'B%'  
  -- Checks if ' Bye' matches pattern 'B%': 0 (FALSE)
  , 'B' LIKE 'B_'     -- Checks if 'B' matches pattern 'B_': 0 (FALSE)
  , s2 LIKE 'B__'     
  -- Checks if s2 has 'B' followed by any two characters: 1 (TRUE)
  , s2 LIKE '_e'      
  -- Checks if s2 has any one character followed by 'e': 0 (FALSE)
  , s2 LIKE '__e'     
  -- Checks if s2 has any two characters followed by 'e': 1 (TRUE)
  , s2 LIKE 'B_e'     
  -- Checks if s2 starts with 'B', ends with 'e',
--  and has one character in between: 1 (TRUE)
  , s2 LIKE 'B%e'     
  -- Checks if s2 starts with 'B' and ends with 'e'
--  with any number of characters in between: 1 (TRUE)
  , s2 LIKE '_y_'     
  -- Checks if s2 has exactly three characters with 'y' in the middle: 1 (TRUE)
  , s2 LIKE '%y%'     
  -- Checks if s2 contains 'y' anywhere: 1 (TRUE)
  , 'y' LIKE '%y%'    -- Checks if 'y' matches pattern '%y%': 1 (TRUE)
  , 'y' LIKE '_y_'    
  -- Checks if 'y' matches pattern '_y_': 0 (FALSE)
  , s2 LIKE '%%e'     
  -- Checks if s2 ends with 'e' (redundant): 1 (TRUE)
  , s2 LIKE 'B%%'     
  -- Checks if s2 starts with 'B' followed by any number
--  of '%' (redundant): 1 (TRUE)
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr9;
-- Explanation:
-- This section further explores pattern matching
-- using the 'LIKE' operator with different patterns.
-- It demonstrates how patterns can be constructed
-- to match specific string formats.

-- IN and NOT IN with Comma-Delimited Lists
SELECT s1, s2         -- Original strings: 'Hi' and 'Bye'
  , s1 IN ('Hi','Bye')      
  -- Checks if s1 is in the list ('Hi','Bye'): 1 (TRUE)
  , s2 IN ('Hi','Bye')      
  -- Checks if s2 is in the list ('Hi','Bye'): 1 (TRUE)
  , s1 NOT IN ('Hi','Bye')  
  -- Checks if s1 is not in the list ('Hi','Bye'): 0 (FALSE)
  , s2 NOT IN ('Hi','Bye')  
  -- Checks if s2 is not in the list ('Hi','Bye'): 0 (FALSE)
  , 'Hello' IN ('Hi','Bye') 
  -- Checks if 'Hello' is in the list ('Hi','Bye'): 0 (FALSE)
  , 'Hello' IN (s1,s2)      
  -- Checks if 'Hello' is in the list (s1, s2): 0 (FALSE)
  , 'Hi'    IN (s1,s2)      
  -- Checks if 'Hi' is in the list (s1, s2): 1 (TRUE)
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr10;
-- Explanation:
-- - 'IN' checks if a value exists within a specified list.
-- - 'NOT IN' checks if a value does not exist within a specified list.
-- - Useful for filtering records based on multiple possible values.

-- NULL Checks
SELECT s1, s2, s3        -- Original strings: 'Hi', 'Bye', and NULL
  , s1 = s3                -- Comparison with NULL: NULL
  , s2 <> s3               -- Comparison with NULL: NULL
  , s1 = IFNULL(s3, '')    -- NULL handled using IFNULL: 0 (FALSE)
  , s2 <> IFNULL(s3, '')   -- NULL handled using IFNULL: 1 (TRUE)
  , s3 IS NULL             -- Checks if s3 is NULL: 1 (TRUE)
  , s1 IS NOT NULL         -- Checks if s1 is not NULL: 1 (TRUE)
  , NULL IN (s1, s2, s3)   -- Checks if NULL is in the list: NULL
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2
           , NULL AS s3) tsr11;
-- Explanation:
-- - NULL represents an unknown value;
-- comparisons with NULL result in NULL (unknown).
-- - 'IS NULL' and 'IS NOT NULL' are used
-- to explicitly check for NULL values.
-- - 'IFNULL' provides a workaround to
-- handle NULLs by substituting them with a default value.

-- Logical AND Operator
SELECT s1, s2             -- Original strings: 'Hi' and 'Bye'
  , s1 = 'Hi' AND s2 = 'Bye' -- Both conditions TRUE: 1 (TRUE)
  , s1 = 'Hi' AND s2 = 'Hi'  -- One condition FALSE: 0 (FALSE)
  , s1 = 'Bye' AND s2 = 'Bye' -- One condition FALSE: 0 (FALSE)
  , s1 = 'Bye' AND s2 = 'Hi'  -- Both conditions FALSE: 0 (FALSE)
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr12;
-- Explanation:
-- - 'AND' operator requires both conditions
-- to be TRUE for the result to be TRUE.
-- - Demonstrates different scenarios where
-- 'AND' evaluates to TRUE or FALSE.

-- Logical OR Operator
SELECT s1, s2             -- Original strings: 'Hi' and 'Bye'
  , s1 = 'Hi' OR s2 = 'Bye' -- Either condition TRUE: 1 (TRUE)
  , s1 = 'Hi' OR s2 = 'Hi'  -- One condition TRUE: 1 (TRUE)
  , s1 = 'Bye' OR s2 = 'Bye' -- One condition TRUE: 1 (TRUE)
  , s1 = 'Bye' OR s2 = 'Hi'  -- Both conditions FALSE: 0 (FALSE)
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr13;
-- Explanation:
-- - 'OR' operator requires at least
-- one condition to be TRUE for the result to be TRUE.
-- - Demonstrates different scenarios
-- where 'OR' evaluates to TRUE or FALSE.

-- Conditional Row Selection Examples

-- Row will display because s1 = 'Hi'
SELECT s1, s2             
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr14
WHERE s1 = 'Hi';
-- Explanation:
-- This query selects rows where s1 is 'Hi'.
-- Since tsr14 has s1 as 'Hi', the row is displayed.

-- Row will display because both
-- s1 = 'Hi' and s2 = 'Bye' are TRUE
SELECT s1, s2             
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr15
WHERE s1 = 'Hi' AND s2 = 'Bye';
-- Explanation:
-- Both conditions in the WHERE clause are TRUE, so the row is displayed.

-- Row will not display because neither condition is TRUE
SELECT s1, s2             
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr16
WHERE s2 = 'Hi' OR s1 = 'Bye';
-- Explanation:
-- Neither s2 is 'Hi' nor s1 is 'Bye', so no rows are returned.

-- Row will display because s1 is in ('Hi','Bye') and s2 starts with 'B'
SELECT s1, s2             
FROM (SELECT 'Hi'  AS s1
           , 'Bye' AS s2) tsr17
WHERE s1 IN ('Hi','Bye') AND s2 LIKE 'B%';
-- Explanation:
-- - s1 is either 'Hi' or 'Bye' (TRUE).
-- - s2 starts with 'B' (TRUE).
-- Both conditions are TRUE, so the row is displayed.

-- -------------------------------------------------------------------
-- Date and Time Functions

-- DATE, DATETIME, TIME, TIMESTAMP formats and comparisons
-- Formats are fixed-width and compared lexicographically (as strings)
-- Must be enclosed in single quotes

-- DATE format: 'YYYY-MM-DD' (10 characters, zero-padded)
'2024-05-05' > '2024-04-30' -- TRUE

-- TIME format: 'HH:MM:SS' (8 characters, 24-hour format)
'09:06:03' > '21:10:02' -- FALSE

-- DATETIME format: 'YYYY-MM-DD HH:MM:SS' (19 characters)
'2024-05-05 12:30:45' > '2024-05-05 12:30:44' -- TRUE

-- Example of comparing DATETIME values
SELECT d1, d2
    , d1 <= d2                               -- 1 (TRUE)
    , d1 = d2                                -- 0 (FALSE)
    , d1 > d2                                -- 0 (FALSE)
    , d1 = '2020-01-01 00:00:00'             -- 1 (TRUE)
    , d2 = '2020-01-01 00:00:00'             -- 0 (FALSE)
    , d1 BETWEEN '2019-01-01 00:00:00'
             AND '2022-01-01 00:00:00'     -- 1 (TRUE)
    , d1 NOT BETWEEN '2019-01-01 00:00:00'
                 AND '2022-01-01 00:00:00' -- 0 (FALSE)
FROM (SELECT '2020-01-01 00:00:00' AS d1
           , '2021-12-31 23:59:59' AS d2) tsr20;
-- Explanation:
-- - Demonstrates comparison operators with DATETIME values.
-- - Shows how 'BETWEEN' includes the boundary values.

-- NOW function with date numeric functions
SELECT d1
    , QUARTER(d1)     -- Returns the quarter of the year (1-4)
    , YEAR(d1)        -- Returns the year part
    , MONTH(d1)       -- Returns the month part (1-12)
    , DAY(d1)         -- Returns the day part (1-31)
    , HOUR(d1)        -- Returns the hour part (0-23)
    , MINUTE(d1)      -- Returns the minute part (0-59)
    , SECOND(d1)      -- Returns the second part (0-59)
    , WEEKDAY(d1)     -- Returns the weekday (0 = Monday, ..., 6 = Sunday)
FROM (SELECT NOW() AS d1) tsr21;
-- Explanation:
-- - 'NOW()' returns the current date and time.
-- - Various date functions extract specific
-- components from the DATETIME value.

-- NOW and common string format functions
-- Reference: https://www.w3schools.com/sql/func_mysql_date_format.asp 
SELECT d1
    , MONTHNAME(d1)   
	-- Returns the full name of the month (e.g., 'January')
    , DAYNAME(d1)    
	-- Returns the full name of the day (e.g., 'Monday')
    , DATE_FORMAT(d1,'%a, %D of %b %Y %l:%i %p') 
	-- Formats the date into a readable string
                          -- Example: 'Wed, 4th of Oct 2024 3:19 PM'
FROM (SELECT NOW() AS d1) tsr22;
-- Explanation:
-- - 'MONTHNAME' and 'DAYNAME' return the names of the month and day.
-- - 'DATE_FORMAT' allows custom formatting of date
-- and time values using format specifiers.

-- -------------------------------------------------------------------
-- DROP/CREATE-TRUNCATE/INSERT/SELECT TABLE Syntax

-- DROPTABLE Statement
-- Drops the table from the database if it exists
DROP TABLE IF EXISTS table_name;
-- Explanation:
-- - Safely removes a table without raising
-- - an error if the table does not exist.

-- CREATE TABLE Statement
CREATE TABLE IF NOT EXISTS table_name (
    colPK     MEDIUMINT UNSIGNED AUTO_INCREMENT,   
	-- Primary Key: auto-incrementing integer
    col2      DATATYPE(size) NULL DEFAULT value, 
    ...
    colN      DATATYPE(size) NULL,
    colFKs    INT NULL,              -- Foreign Keys
    p_id_user INT,                   
	-- Reference to the logged-in user
    date_mod  DATETIME DEFAULT NOW(),
	-- Modification date: defaults to current timestamp
    active    TINYINT(1) DEFAULT 1,  
	-- Active flag: 1 (active), 0 (inactive)
    
    CONSTRAINT table_name__PK PRIMARY KEY(colPK),        
	-- Primary Key Constraint
    CONSTRAINT table_name__UK UNIQUE(col2, ..., colN)    
	-- Unique Key Constraint
);
-- Explanation:
-- - Defines the structure of a new
-- - table with various columns and constraints.
-- - 'AUTO_INCREMENT' automatically assigns
-- - a unique value to 'colPK'.
-- - 'CONSTRAINT' clauses define primary and
-- - unique keys to enforce data integrity.

-- TRUNCATE TABLE Syntax
TRUNCATE TABLE table_name;
-- Explanation:
-- - Removes all records from the table quickly.
-- - Resets the auto-increment counter.

-- Example in Boxstore Code: After CREATE TABLE
-- , truncate 'people' table
TRUNCATE TABLE people;
-- Explanation:
-- - Ensures the 'people' table starts empty before
-- - inserting new data.

-- DELETE Syntax (Only Add Syntax to Cheatsheet)
-- DELETE will not reset the primary key back to 1
DELETE FROM table_name WHERE 1=0;
-- Explanation:
-- - This example deletes no rows because
-- the condition '1=0' is always FALSE.
-- - Useful as a template for DELETE statements
-- with specific conditions.

-- SELECT Syntax
SELECT DISTINCT column1, column2, ..., columnN
       , sys1, sys2, sys3 
FROM table_name 
WHERE filter_condition AND|OR second_condition
-- GROUP BY group_column
-- HAVING aggregate_condition
ORDER BY column2 DESC, ...
LIMIT rowoffset, rowsperpage;
-- Explanation:
-- - 'SELECT DISTINCT' retrieves unique combinations
-- - of specified columns.
-- - 'GROUP BY' groups rows that have the same values
-- - in specified columns.
-- - 'HAVING' filters groups based on aggregate conditions.
-- - 'ORDER BY' sorts the result set based on specified columns.
-- - 'LIMIT' restricts the number of rows returned,
-- useful for pagination.

-- For Paging: Calculate the Row Offset
-- Example: Page 4 with 10 rows per page
-- Formula: (Page# * RowsPerPage) - RowsPerPage = RowOffset#
-- So, LIMIT 30, 10
-- This retrieves rows 31 to 40.

-- LIMIT Examples
LIMIT 2;           -- Displays the first 2 rows
LIMIT 0, 10;      -- Displays the first 10 rows
LIMIT 30, 10;     -- Displays rows 31 to 40

-- DISTINCT Keyword
-- Ensures that only unique rows are returned based on
-- the selected columns.

-- INSERT Syntax
INSERT INTO table_name (column2, ..., columnN)
VALUES (value2, ..., valueN);
-- Explanation:
-- - Inserts a new row into the specified table with
-- the provided values.
-- - Columns must match the order and data types of the
-- table definition.

-- Working Example for 'people' Table
DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
       p_id       INT(11) AUTO_INCREMENT,   -- Primary Key
       full_name  VARCHAR(100) NULL,        
	   -- Full name of the person
       CONSTRAINT people___PK PRIMARY KEY(p_id)  
	   -- Primary Key Constraint
);
-- Explanation:
-- - Creates a 'people' table with 'p_id'
-- - as the primary key and 'full_name' as a nullable VARCHAR.
-- - Unique constraints can be added as needed to
-- prevent duplicate entries.

-- View 'people' Table Structure
DESCRIBE people;
-- Explanation:
-- - Displays the structure of the 'people' table,
-- - showing column names, types, nullability, and keys.


-- working example of DROP/CREATE-TRUNCATE/INSERT/SELECT 


--  DROP/CREATE-TRUNCATE/INSERT/SELECT people TABLE
-- syntax for the people table
DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
	  p_id       MEDIUMINT    UNSIGNED AUTO_INCREMENT,
	  full_name  VARCHAR(191) NULL,
	  CONSTRAINT people___PK  PRIMARY KEY(p_id)
      --  , CONSTRAINT people___UK_fname UNIQUE(full_name)
);



TRUNCATE TABLE people;

INSERT INTO people (full_name) VALUES ('Brad Vincelette');
INSERT INTO people (full_name) VALUES ('Abdulmalik Oyedotun');


-- final working SQL
SELECT p_id, full_name 
FROM people 
WHERE 1=1;

-- final working SQL
SELECT p_id, full_name , CHAR_LENGTH(full_name)
FROM people 
WHERE 1=1
ORDER BY CHAR_LENGTH(full_name) DESC;


-
-- verify your query works (returns 2 rows). 
-- this  is required every insert or update.
SELECT p_id, full_name 
FROM people 
WHERE 1=1;

-- JOIN
SELECT tn.col_pk , tn.col_vc, tn.col_ch, tn.col_dt, tn.fol_id
	 , tf.fol_id, tf.fol_vc
FROM table_name tn
	 JOIN table_name_first tf ON tn.fol_id=tf.fol_id
WHERE 1=1;






-- Load data from a CSV file into a MariaDB table
LOAD DATA INFILE 
"C:/_data/MariaDB_11.5/ao_0411591_boxstore_people_10000.csv"
-- Specify the target table where data will be inserted
INTO TABLE people
-- Fields in the file are separated by commas (CSV format)
FIELDS TERMINATED BY ','
-- Fields are enclosed in double quotes
ENCLOSED BY '"'
-- Each line represents a new record, terminated by a newline character
LINES TERMINATED BY '\n'
-- Insert data into the 'full_name' column of the 'people' table
(full_name);



-- Verify 'people' Table Query Works
SELECT p_id, full_name 
FROM people 
WHERE 1=1;  -- Always TRUE, returns all rows (0 rows if table is empty)
-- Explanation:
-- - 'WHERE 1=1' is a tautology and
-- - effectively selects all rows from the table.

-- -------------------------------------------------------------------
-- ALTER TABLE Syntax

-- Adding Columns to a Table
ALTER TABLE table_name 
  ADD COLUMN column3 DATATYPE(size) NULL,
  ADD COLUMN column4 DATATYPE(size) NULL,
  ...
  ADD COLUMN columnN DATATYPE(size) NULL;
-- Explanation:
-- - Adds new columns to an existing table.
-- - Each 'ADD COLUMN' statement specifies
-- the column name, data type, and nullability.

-- Modifying Columns in a Table
ALTER TABLE table_name 
  MODIFY COLUMN columnN DATATYPE(size) NULL;
-- Explanation:
-- - Changes the definition of an existing column
--, such as data type or nullability.

-- Dropping Columns from a Table
ALTER TABLE table_name 
  DROP COLUMN columnN;
-- Explanation:
-- - Removes a column from the table permanently.

-- Combining Multiple Alterations
ALTER TABLE table_name 
  ADD COLUMN column3 DATATYPE(size) NULL,
  MODIFY COLUMN columnN DATATYPE(size) NULL,
  DROP COLUMN columnN;
-- Explanation:
-- - Performs multiple alterations in a single
-- statement for efficiency.
-- - Each alteration is separated by a comma.

-- -------------------------------------------------------------------
-- UPDATE Statement

-- Updates data within tables based on specified conditions
UPDATE table_name 
SET    column1_varchar = 'value1',
       column2_datetime = '2024-10-09 15:19:45',
       column3_int = 100,
       column4_decimal = -123.99,
       ...
       columnN = 'valueN'
WHERE  id = 1000;

-- encrypting passwords
-- SALTING A8*&()%#$%^%
SELECT MD5(CONCAT('fluffy-BUMPER_2937!', 'A8*&()%#$%^%'));

-- returns: 25b4792a9bc9f1c1c03d0d0c3473cd9d


-- Explanation:
-- - 'UPDATE' modifies existing records in the table.
-- - 'SET' specifies the columns to be
-- - updated and their new values.
-- - 'WHERE' clause determines which rows to update;
-- - without it, all rows are updated.
-- - It's crucial to use precise conditions to
-- - avoid unintended data changes.

-- Parsing Strings Example

-- Scenario: Split 'FirstName LastName' into 'FirstName' and 'LastName'
-- Example String: 'FirstName LastName'
-- Character Positions:
-- 0        1         2					Ruler Tens
-- 012345678901234567890					Ruler Ones
-- 'FirstName LastName'
-- 1       ^?^      ^
--         |^|= space position (SP)
--         ? ?      ? = LENGTH - SP
--      SP-1 SP+1            

-- INSTR Function: Finds the position of a substring within a string
SELECT INSTR(full_name, ' ') AS pos
     , INSTR(full_name, ' ') - 1 AS first_name_end_letter
     , INSTR(full_name, ' ') + 1 AS last_name_beg_letter
FROM people;
-- Explanation:
-- - 'INSTR(full_name, ' ')': Finds the position of the first
-- space character.
-- - Calculates positions to extract 'FirstName' and 'LastName'.

-- MID Function: Extracts a substring from a string
SELECT full_name
 , TRIM(MID(full_name, 1, INSTR(full_name, ' ') - 1)) AS first_name
 , TRIM(MID(
            full_name,
            INSTR(full_name, ' ') + 1,
            CHAR_LENGTH(full_name) - INSTR(full_name, ' ')
         )) AS last_name
FROM   people
WHERE  p_id > 2;
-- Explanation:
-- - 'MID(full_name, start, length)':
-- - Extracts a substring starting at 'start' for 'length' characters.
-- - 'TRIM' removes any leading or
-- - trailing spaces from the extracted substrings.
-- - This splits 'full_name' into 'first_name' and
-- - 'last_name' based on the space position.

-- -------------------------------------------------------------------

-- Entity Relationship Diagram (ERD)

-- Cardinalities
/*


1 means one
0M means zero to many
1M means one to many
01 means zero to one

tableA.PK  -1-----------------0M- tableB.FK 

tableA.PK  -1-----------------1M- tableB.FK
 
-- other JOIN cardinalituies
tableA.PK  -1-----------------1- tableB.FK(maybe)

tableA.PK  -1-----------------01- tableB.FK(later)

tableA.PK  -1-----------------0M- tableB.FK(not here)

*/

-- Draw.IO
-- Orthogonal for all JOINs except SELF JOIN(Vertical)
-- Blue dots when connecting line ends (no green lines)
-- Use Entity Relation (shape panel) and minimize other

-- -------------------------------------------------------------------
-- ALTER Syntax 

-- Copy
ALTER TABLE   table_name 
  ADD COLUMN  column3  datatype(size) nullable
, ADD COLUMN  column4  datatype(size) nullable
...
, ADD COLUMN  columnN  datatype(size) nullable;

ALTER TABLE   table_name 
  MODIFY COLUMN columnN datatype(size) nullable;

ALTER TABLE   table_name 
  DROP COLUMN columnN;
-- can be done all together:
ALTER TABLE   table_name 
  ADD COLUMN  column3  datatype(size) nullable
  MODIFY COLUMN columnN datatype(size) nullable;
  DROP COLUMN columnN;
 
-- Working Example
 
 ALTER TABLE people 
    DROP COLUMN IF EXISTS full_name
  , MODIFY COLUMN first_name VARCHAR(35) NOT NULL
  -- , MODIFY COLUMN last_name  VARCHAR(35)
  , ADD COLUMN email_addr    VARCHAR(50)
  , ADD COLUMN password      CHAR(32)
  , ADD COLUMN phone_pri     CHAR(11)     -- NOT NULL later switch
  , ADD COLUMN phone_sec     CHAR(11) 
  , ADD COLUMN phone_fax     CHAR(11) 
  , ADD COLUMN addr_suite    VARCHAR(20) 
  , ADD COLUMN addr          VARCHAR(60) 
  , ADD COLUMN addr_code     CHAR(7) 
  , ADD COLUMN addr_info     VARCHAR(100) 
  , ADD COLUMN addr_delivery TEXT 
  , ADD COLUMN addr_type_id  TINYINT      -- FK geo_address_type
  , ADD COLUMN tc_id         MEDIUMINT    -- FK geo_towncity
  , ADD COLUMN usermod       MEDIUMINT UNSIGNED NOT NULL DEFAULT 2
  , ADD COLUMN datemod       DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP
  , ADD COLUMN useract       MEDIUMINT UNSIGNED NOT NULL DEFAULT 1
  , ADD COLUMN dateact       DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP
  , ADD COLUMN active        BIT                NOT NULL DEFAULT 1
;



-- -------------------------------------------------------------------
-- UPDATE syntax 
-- copy
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

-- Working Example
-- Update Employee Record
UPDATE people
SET email_addr = LOWER(CONCAT(first_name, '.', last_name,
'@boxstore.com')),
    password = MD5('Cdjde;l1&&'),  
    -- replace with actual secure passwords
    phone_pri = 12047834784,
    phone_sec = 12049823932,
    phone_fax = 12040933873,
    addr_suite = 'apt 602',
    addr = 'ballantrae drive',  -- Replace with actual address
    addr_code = 'R3T6J3',  -- Canadian postal code format, uppercase
    addr_info = NULL,
    addr_delivery = 'drop at the front door',
    addr_type_id = (SELECT addr_type_id FROM geo_address_type WHERE addr_type = 'Apartment'),
    tc_id = (SELECT tc_id FROM geo_towncity WHERE tc_name = 'Winnipeg'),
    usermod = 2,
    datemod = NOW()
WHERE p_id = 2;

-- -------------------------------------------------------------------
-- JOIN ON syntax
SELECT a.column1, a.column2, … 
	 b.column1, b.column2, … 
	 c.column1, c.column2, … 
FROM atable a
     JOIN btable b ON a.PK_FK_col=b.FK_PK_col
     JOIN ctable c ON b.PK_FK_col=c.FK_PK_col;

-- working example
SELECT gt.tc_id, gt.tc_name, gt.rg_id
     , gr.rg_id, gr.rg_name, gr.co_id
     , gc.co_id, gc.co_name, gc.co_abbr
FROM   geo_towncity gt
       JOIN geo_region gr ON gt.rg_id=gr.rg_id
       JOIN geo_country gc ON gr.co_id=gc.co_id;







-- --------------------------------------------------------------------
-- BUILT-IN fucntions
-- UPPER: converts a string to upper-case.

-- working example
SELECT first_name, UPPER(first_name)
FROM   people
WHERE  p_id = 1;

-- The name of the function is called: UPPER
-- The parameter here is a column: first_name


-- Tip:When choosing a name, use one that is intuitive for 
-- others to understand.  Programmers need labels without spaces 
-- so suffixing the first_name with _upper is a wise method. 
-- And if you just need the first_name column upper case
-- then just use first_name as the label.

-- More Examples 

SELECT first_name
     ,  UPPER(first_name) AS first_name_upper
FROM   people
WHERE  p_id = 1;

SELECT UPPER(first_name) AS first_name
FROM   people
WHERE  p_id = 1;

SELECT p_id, first_name, last_name
FROM   people
WHERE  UPPER(first_name) = 'STEPHEN';




-- LOWER: converts a parameter value into all lower case.

-- working example
 SELECT p_id, first_name, last_name
FROM   people
WHERE  LOWER(first_name) = 'stephen';



-- SUBSTR: returns a portion of a value

SUBSTR('value',
      character_position_to_start,
      number_of_characters_to_return)

-- Ruler 123456789
SELECT  'Red River'
1 => R
2 => e
3 => d
4 => (space character)
5 => R
6 => i
7 => v
8 => e
9 => r
-- SUBSTR parameters
-- 1st Parameter 'Red River': The value we start with.
-- 2nd Parameter: A number indicating which character 
--                position to start from.
-- 3rd Parameter: A number indicating how many characters 
-- the result will contain.(defaults to the value’s 
-- character length when omitted)

-- working example
SELECT SUBSTR('Red River', 1, 3)
-- Returns the value: rEd

SELECT SUBSTR('Red River', 5, 5)
-- Returns: River

SELECT SUBSTR('Red River', 5)
-- Returns: River



-- INSTR: locates one or more characters within a value.
-- Returns a number that represents the character position
-- where the sought value was located(If not found a zero is returned)

INSTR ('string to search in','string 
portion you are searching for')

-- 1st Parameter'Red River': The value we want to search.
-- 2nd Parameter 'i': The pattern you are searching for
-- Returns the value: 6 (the first occurance of R)

-- working Example
SELECT INSTR('Red River','e')
-- Returns: 2(Starting at position 1, the first occurrence of e 
-- is position 2

SELECT first_name, last_name
FROM   people
WHERE  INSTR(last_name,'J') = 1



-- CHAR_LENGHT
-- Returns the length of the value

-- working Example
SELECT CHAR_LENGTH('Red River');
-- (Returns 9)


SELECT p_id, first_name, last_name
FROM people
WHERE CHAR_LENGTH(first_name) > 8;
-- Display only the people who have a first name with more
-- than 8 characters





-- LENGHT
-- wworking Example
SELECT first_name, last_name
FROM people
WHERE LENGTH(first_name) + LENGTH(last_name) <
15;





-- LPAD / RPAD
-- Functions - LPAD / RPAD
-- Parameters
-- 1st Parameter 'Red': The value we want to format.
-- 2nd Parameter 6: A number used to determine the
-- maximum size of the returned output.
-- 3rd Parameter '*': A single character used to pad
-- the original value to reach the maximum size


-- working Example
LPAD('value',
maximum_character_result,
padding_character)


RPAD('value',
maximum_character_result,
padding_character)




-- TRIM
-- Takes a value and returns it with leading
-- padding characters removed

--working Example
SELECT LTRIM(' my value ')

-- Returns: ‘my value ‘

-- RTRIM
-- Takes a value and returns it with trailing
-- padding characters removed.


-- working Example
SELECT RTRIM(' my value ')
-- Returns: ‘ my value‘
-- (No space characters after the e, but there are still
-- space characters before the m)



-- CONCAT
-- Takes in 2 or more values and returns them both
-- together as a single value.

-- working Example
SELECT CONCAT('my',' ','value')

-- Returns: my value



-- REPLACE
-- Finds and replaces text within a string.

-- Working Example
SELECT
REPLACE('replace the space with underscore',' ','_')
-- Returns: replace_the_space_with_underscore






-- --------------------------------------------------------------------
--Functions - Numbers
-- ROUND 
-- Rounds a number off to the nearest specified digit.
-- 1st Parameter: The original value.
-- 2nd Parameter: An optional value used to determine
-- which digit to round to.
-- ● Defaults to 0 if no value is present.
-- ● Positive numbers will round to a decimal.
-- ● Negative numbers will round to a specific whole number position

-- Working examples
SELECT ROUND(123.2, 0);
-- Returns: 123




-- TRUNC
-- Removes numbers to the nearest specified digit (does not round).
-- 1st Parameter: The original value.
-- 2nd Parameter: An optional value used to determine
-- which digit to truncate to.
-- ● Defaults to 0 if no value is present.
-- ● Positive numbers will go to a decimal.
-- ● Negative numbers will go to a whole number.

-- Working Example
-- TRUNCATE(25.8) Returns 25
-- TRUNCATE(7.56, 1) Returns 7.5
--  TRUNCATE(1456.56, -2) Returns 1400


-- MOD (Modulus)
-- Calculates the remainder of a division.
-- 1st Parameter: The original value.
-- 2nd Parameter: The value to divide by.

-- Working examples
SELECT MOD(7, 3);
-- Returns 1
-- 7 divided by 3 is 2 with a remainder of 1



-- ABS (Absolute Value)
-- Returns the positive version of number.
-- 1st Parameter: The original value.


-- Working Example
SELECT ABS(3);
-- Returns 3

SELECT ABS(-3);
-- Returns 3


-- IFNULL
-- Substitutes a value for a NULL value returned by a query

-- Working Example
SELECT IFNULL(addr_delivery,'Knock please!')
FROM people;







-- -------------------------------------------------------------------
-- AGGREGATE_FUNCTIONS
-- COUNT(*)
SELECT COUNT(*) AS emp_cnt
FROM people_employee;






-- COUNT (DISTINCT column_name)
SELECT COUNT(DISTINCT first_name) AS first_name_cnt_unique
FROM people;


-- SUM()
-- working example
SELECT SUM(pe_salary) AS pe_salary_max
FROM pwoplw_employee

;



-- GROUP_CONCAT
-- working_example






--AVG
-- working Example
SELECT AVG(pe_salary) AS pe_salary_min
FROM people_employee;




-- MIN
-- working Example
SELECT MIN(pe_salary) AS pe_salary_min
FROM people_employee;



--MAX 
-- working Example
SELECT MAX(pe_salary) AS pe_salary_max
FROM people_employee;









-- --------------------------------------------------------------------
-- SELECT syntax GROUP BY & HAVING

SELECT column1, column2 ......, SUM(columnN)
FROM table_view_subquery_temp_result_set
WHERE filter_conditional
GROUP BY column1, column2 ...
HAVING SUM(columnN>100.00
ORDER BY column1, column2
LIMIT 0, 10 -- first 10 records of results
;




-- --------------------------------------------------------------------
-- (INNER)/LEFT/RIGHT/OUTER/FULL/CROSS JOIN & UNION & VIEWS


-- 4 rows in country (PKs are never NULL)
SELECT gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_country gco;

-- 7 rows in region (FKs can be NULL, but not in this table...yet)
SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
FROM   geo_region grg;

-- INNER JOIN: 
-- show all 7 regions and their country matches FK=PK on co_id
SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
     , gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_region grg 
       JOIN geo_country gco ON grg.co_id=gco.co_id
;
-- noting geo_region is regarded as the LEFT table 
-- (ie: so the first defined table within FROM/JOIN is the LEFT TABLE)

-- geo_country is regarded as the RIGHT table 
-- (ie: second defined table in FROM/JOIN)

-- the JOIN's ON section "=" expression, should be listed in the
-- order of the tables, so the KEY column from the LEFT table  
-- equaling the KEY column on the RIGHT table

-- in the above case LEFT table geo_region has FK of grg.co_id, then
-- an equal sign =, then the PK of the RIGHT table country table 
-- gco.co_id, thus:

-- syntax (these aren't to be ran, just uncommented for syntax highlighting)
SELECT ...
FROM LEFT_TABLE lt 
     JOIN RIGHT_TABLE rt ON lt.LEFT_COLUMN_FKorPK = rt.RIGHT_COLUMN_PKorFK
;

SELECT ...
FROM   geo_region grg /* LEFT TABLE */        -- LEFT COL(FK) RIGHT COL(PK)
       JOIN geo_country gco /* RIGHT TABLE */ ON grg.co_id = gco.co_id
;            

SELECT ...
FROM   geo_country gco /* LEFT TABLE */        -- LEFT COL(FK) RIGHT COL(PK)
       JOIN geo_region grg /* RIGHT TABLE */ ON gco.co_id = grg.co_id
;            


-- throughout a FROM/JOIN statement, with multiple JOINs within, the 
-- FIRST defined table in the order that the statement is written is 
-- always considered as the LEFT table, with respect to any table within 
-- the JOINs that are written in later.  The secondary tables on the JOIN
-- parts are also LEFT tables, with respect to any other JOINs following  
-- that JOIN, if you are matching columns from those secondary tables. 

-- Everything we do in IT, is very left to right oriented, the way
-- you should work, notes/assignment (INPUTS) on LEFT side of screen, 
-- solution (OUTPUTS) on the RIGHT side of screen. Most software is left
-- to right as well, ie: FTP (left side is local computer, right side
-- is the remote server)

-- FROM/JOINs always should be written and thought out this way, LEFT
-- to RIGHT and its always FK=PK or PK=FK (depending on where the KEY
-- columns are situated, in the LEFT table or RIGHT table)



-- -------------------------------------------------------------------
-- 
-- OUTER JOINs
-- 
-- What if we have a record in one table, that was never assigned as 
-- a FOREIGN KEY in the other table?  This "could" be something we need
-- to fix.
-- 
-- So let's INSERT records into each table that don't exist in the 
-- other

-- inserting a country that could not have an FK yet assigned in the 
-- region table, so it has no "JOIN" or match yet
INSERT INTO geo_country (co_name, co_abbr)
VALUES                  ('Atlantis','AT');  -- co_id=5


-- need to loosen the FK in the region table to allow NULL for FK
ALTER TABLE geo_region MODIFY co_id TINYINT NULL;

-- inserting new region without specifying the country co_id FK, so
-- the Aqualand is not assigned any country, as it is not including
-- the co_id FK in the INSERT...
INSERT INTO geo_region (rg_name, rg_abbr)
VALUES                  ('Aqualand','AL');  -- rg_id=8

-- ...recall that previous INSERTs to this table had: 
-- INSERT INTO geo_region (rg_name, rg_abbr, co_id) on
-- the INSERT line, and a corresponding value on the VALUES 
-- line




-- -------------------------------------------------------------------
-- LEFT JOIN 
--     * shows every record from LEFT table regardless of the JOIN
-- 
--     * any type of JOIN will still do the JOIN, matches always found
-- 
--     * the ON part of the JOIN, really should be in the order of
--       the tables, so if the FK is in the LEFT table and PK in the 
--       RIGHT table, then in the ON it is FK=PK (and visa versa, if
--       PK in left, FK in right, then JOIN's ON is PK=FK
-- 
--     * this query will not show the non-matching record from the
--       RIGHT table, only the LEFT table non-matching record/row. 


-- shows all geo_region's matched via the JOIN, and also the unmatched 
-- record of Aqualand from the LEFT table, noting all columns in the 
-- geo_country are displaying NULL, and we DO NOT SEE Atlantis.
--  
-- (uncomment the WHERE clause to show you ONLY that non-matching row
--  from the LEFT table)

SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
     , gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_region grg
       LEFT JOIN geo_country gco ON grg.co_id=gco.co_id
-- WHERE gco.co_id IS NULL  -- uncommenting the start of the WHERE  
                            -- line shows only the unmatched from 
                            -- the LEFT
;


-- shows all geo_country's regardless of matching records in the RIGHT 
-- table  (uncomment the WHERE clause to show you the non-matching row
-- ONLY from the LEFT table)
SELECT gco.co_id, gco.co_name, gco.co_abbr
     , grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
FROM   geo_country gco
       LEFT JOIN geo_region grg ON gco.co_id=grg.co_id
-- WHERE grg.co_id IS NULL  -- uncommenting this line shows only the unmatched from the LEFT
;


-- -------------------------------------------------------------------
-- RIGHT JOIN
-- 

SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
     , gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_region grg
       RIGHT JOIN geo_country gco ON grg.co_id=gco.co_id
-- WHERE grg.rg_id IS NULL
;

SELECT gco.co_id, gco.co_name, gco.co_abbr
     , grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
FROM   geo_country gco
       RIGHT JOIN geo_region grg ON gco.co_id=grg.co_id
-- WHERE gco.co_id IS NULL
;




-- -------------------------------------------------------------------
-- FULL JOIN (MySQL doesn't support FULL JOIN, use UNION
--            with a LEFT JOIN and RIGHT JOIN query)

SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
     , gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_region grg
       LEFT JOIN geo_country gco ON grg.co_id=gco.co_id
-- WHERE gco.co_id IS NULL 
UNION
SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
     , gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_region grg
       RIGHT JOIN geo_country gco ON grg.co_id=gco.co_id
-- WHERE grg.rg_id IS NULL
;


-- OUTER JOINs are most useful in the Final Project
-- if perhaps you are not seeing the number rows you 
-- should be seeing, so you apply a LEFT or RIGHT to 
-- see if you are seeing more returned rows.

-- If the OUTER JOIN is showing the same number of 
-- rows as a normal JOIN, then you don't need the OUTER
-- JOIN (so remove the LEFT or RIGHT from the word JOIN)
-- as these require more memory when ran...

-- ...as they always do a JOIN, but then they will still 
-- check for rows from either table without a proper 
-- PK=FK JOIN.




-- -------------------------------------------------------------------
-- ATTACHING RECORDS  (change 5 to NULL to rebreak)

-- creates relationships
UPDATE geo_region
SET    co_id=5
WHERE  rg_id=8; 


-- JOIN (INNER) - would work now

SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id
     , gco.co_id, gco.co_name, gco.co_abbr
FROM   geo_region grg
       JOIN geo_country gco ON grg.co_id=gco.co_id
;

-- unsets relationships
UPDATE geo_region
SET    co_id=NULL
WHERE  rg_id=8;





-- -------------------------------------------------------------------
-- UNION

SELECT 'region', grg.rg_id, grg.rg_name, grg.rg_abbr
FROM   geo_region grg
UNION       
SELECT 'country', gco.co_id, gco.co_name, gco.co_abbr 
FROM  geo_country gco
;




-- -------------------------------------------------------------------
-- CROSS JOIN (every iteration of region to country)

SELECT grg.rg_name, gco.co_name
FROM   geo_region grg, geo_country gco;

-- for tables that you need all records from a particular table,
-- as it relates to your receipts in the FINAL PROJECT





-- -------------------------------------------------------------------
-- VIEW (stored queries, uncomment column name line to use diff col names)

-- can have a DROP VIEW IF EXISTS join__geo_towncity_region_country;
-- before just a CREATE VIEW, though the OR REPLACE makes it unnecessary

-- please note this view, requires the columns be uniquely written
-- foreign keys were renamed, column names need to be unique in a view
-- so you can just relabel, gtc.rg_id was labeled where grg.rg_id was 
-- not, the table alias doesn't apply to the name of a column, as it
-- is just a table reference.


CREATE OR REPLACE VIEW join__geo_towncity_region_country AS

    SELECT gtc.tc_id, gtc.tc_name, gtc.rg_id AS gtc_rg_id_FK
         , grg.rg_id, grg.rg_name, grg.rg_abbr, grg.co_id AS grg_co_id_FK 
         , gco.co_id, gco.co_name, gco.co_abbr
    FROM   geo_towncity gtc
           JOIN geo_region grg  ON gtc.rg_id=grg.rg_id
           JOIN geo_country gco ON grg.co_id=gco.co_id
;

SELECT tc_id, tc_name, gtc_rg_id_FK
     , rg_id, rg_name, rg_abbr, grg_co_id_FK
	 , co_id, co_name, co_abbr
FROM join__geo_towncity_region_country;




-- DROP VIEW IF EXISTS region_country;  -- may not work in MySQL

-- please note, this view renames columns, without using labels
-- I don't recommend doing this in the Final Project
CREATE OR REPLACE VIEW region_country
    (region_name, region_code, country_name, country_code) 
AS
    SELECT grg.rg_name, grg.rg_abbr
         , gco.co_name, gco.co_abbr
    FROM   geo_region grg
           JOIN geo_country gco ON grg.co_id=gco.co_id
;

SELECT region_name, region_code, country_name, country_code
FROM region_country;






















