<?php

/* * ****************************************************************** 
 * Date         Name          Description
 * ---------------------------------------
 * 9/17/21      Deanna B       Initial depolyment of employee & employeeDB class. 
 * 
 * ******************************************************************* */

class Employee {

    private $first_name, $last_name;

    public function __construct($first_name, $last_name) {
        $this->first_name = $first_name;
        $this->last_name = $last_name;
    }

    public function getFirstName() {
        return $this->first_name;
    }

    public function getLastName() {
        return $this->last_name;
    }

}

class EmployeeDB {

    public static function getEmployees() {
        $db = Database::getDB();
        $query = 'SELECT first_name, last_name FROM employee ORDER BY last_name';
        $statement = $db->prepare($query);
        $statement->execute();
        $rows = $statement->fetchAll();
        $statement->closeCursor();

        $employees = array();
        foreach ($rows as $row) {
            $employee = new Employee($row['first_name'], $row['last_name']);
            $employees[] = $employee;
        }
        return $employees;
    }

    public static function getEmployeeList() {
        $db = Database::getDB();
        $queryEmployee = 'SELECT * FROM employee';
        $statement1 = $db->prepare($queryEmployee);
        $statement1->execute();
        $employees = $statement1;
        return $employees;
    }

}
?>

