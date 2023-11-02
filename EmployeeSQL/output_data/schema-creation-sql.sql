-- Data Engineering: Queries to create required tables and neccessary constraints for Challenge #9

-- Create departments table with dept_no as primary key
CREATE TABLE "departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- Create titles table with title_id as primary key
CREATE TABLE "titles" (
    "title_id" varchar(200)   NOT NULL,
    "title" varchar(200)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- Create employess table with emp_no as primary key
CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(200)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "sex" char   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Create salaries table that will have salaries drawn by each employee, with emp_no as primary key
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salaries" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

-- Create dept_emp table that will hold dept_no for each employee. Employee can be part of multiple departments hence composite primary key is defined using both dept_no and emp_no
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

-- Create dept_manager table that will manager's emp_no against each dept_no. Since one manager can lead two dept, composite primary key is defined using both dept_no and emp_no
CREATE TABLE "dept_manager" (
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);


-- Alter table definition to add relationship across tables to maintain referential integrity 
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

