-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
drop table "Dep_employees";


CREATE TABLE "Departments" (
    "dept_no" VARCHAR(200)   NOT NULL,
    "dept_name" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dep_employees" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Dep_employees" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Dep_managers" (
    "dept_no" VARCHAR(200)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Dep_managers" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(200)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(200)   NOT NULL,
    "last_name" VARCHAR(200)   NOT NULL,
    "sex" VARCHAR(200)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(200)   NOT NULL,
    "title" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dep_employees" ("dept_no");

ALTER TABLE "Dep_employees" ADD CONSTRAINT "fk_Dep_employees_emp_no_dept_no" FOREIGN KEY("emp_no", "dept_no")
REFERENCES "Dep_managers" ("emp_no", "dept_no");

ALTER TABLE "Dep_managers" ADD CONSTRAINT "fk_Dep_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

