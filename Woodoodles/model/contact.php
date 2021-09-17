<?php

/* * ****************************************************************** 
 * Date         Name          Description
 * ---------------------------------------
 * 9/17/21      Deanna B      Initial depolyment of contact functions.  
 * 
 * ******************************************************************* */

function getVisitByEmp($employee_id) {
    $db = Database::getDB();
    $query2 = 'SELECT contact_id, contact.name, contact.email_address, contact.message, contact.contact_date
FROM contact
JOIN employee on contact.employee_id = employee.employee_id
WHERE employee.employee_id = :employee_id
ORDER BY contact_date';
    $statement2 = $db->prepare($query2);
    $statement2->bindValue(':employee_id', $employee_id);
    $statement2->execute();
    $contacts = $statement2;

    return $contacts;
}

function delContact($contact_id) {
    $db = Database::getDB();
    $contact_id = filter_input(INPUT_POST, 'contact_id', FILTER_VALIDATE_INT);
    $query = 'DELETE FROM contact
WHERE contact_id = :contact_id';
    $statement = $db->prepare($query);
    $statement->bindValue(':contact_id', $contact_id);
    $statement->execute();
    $statement->closeCursor();
}

function addContact($name, $email, $message){
    $db = Database::getDB();
    // Add the product to the database  
            $query = 'INSERT INTO contact
                         (name, email_address, message, contact_date, employee_id)
                      VALUES
                         (:name, :email, :message, NOW(), 1)';
            $statement = $db->prepare($query);
            $statement->bindValue(':name', $name);
            $statement->bindValue(':email', $email);
            $statement->bindValue(':message', $message);
            $statement->execute();
            $statement->closeCursor();
            /* echo "Fields: " . $visitor_name . $visitor_email . $visitor_msg; */
}

?>
