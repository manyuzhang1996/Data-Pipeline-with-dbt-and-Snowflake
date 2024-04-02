/*
Step 1: Setup snowflake environment
*/
/* 
create warehouse, database and role
*/
-- create a role
use role accountadmin;

-- create a warehouse
create warehouse if not exists dbt_wh with warehouse_size = 'x-small';

-- create database
create database if not exists dbt_db;

-- create a new role
create role if not exists dbt_role;

-- show the grants/ privileges on dbt_wh
show grants on warehouse dbt_wh;

-- grant the 'usage' privilege of dbt_wh to the role dbt_role
grant usage on warehouse dbt_wh to role dbt_role;

-- grant the role 'dbt_role' to my own user account
grant role dbt_role to user EMMAZHANG;

-- make sure the role has access to the database we created
grant all on database dbt_db to role dbt_role;

-- use the role we created
use role dbt_role;


/*
create schema
*/
create schema if not exists dbt_db.dbt_schema;
/*
clean up (if needed)
*/
-- use role accountadmin;

-- drop warehouse if exists dbt_wh;
-- drop database if exists dbt_db;
-- drop role if exists dbt_role;