<?php

$dsn = 'mysql:host=localhost;dbname=woodoodles';
$username = 'root';
$password = 'Pa$$w0rd';
$options = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);
try {
    $db = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    $error = $e->getMessage();
    include('view/error.php');
    exit();
}
    $email = 'test@cwi.edu';
    $password = 'Pa$$w0rd';
    $hash = password_hash($password, PASSWORD_DEFAULT);
    $query = 'INSERT INTO administrators (emailAddress, password)
              VALUES (:email, :password)';
    $statement = $db->prepare($query);
    $statement->bindValue(':email', $email);
    $statement->bindValue(':password', $hash);
    $statement->execute();
    $statement->closeCursor();

    echo "Inserted: $email pw: $password hash: $hash<br>"


?>

