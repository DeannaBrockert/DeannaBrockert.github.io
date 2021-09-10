<?php
$dsn = 'mysql:host=localhost;dbname=woodoodles';
$username = 'woodoodles_user';   //'ej_user';
$password = 'Pa$$w0rd';

try {
    $db = new PDO($dsn, $username, $password);
} catch (PDOException $e) {
    $error_message = $e->getMessage();
    /* include('database_error.php'); */
    echo "DB Error: " . $error_message;
    exit();
}

//Check action. On initial load it is null
$action = filter_input(INPUT_POST, 'action');
if ($action == null) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == null) {
        $action = 'list_contacts';
    }
}

if ($action == 'list_contacts') {

//see if employee is set
$employee_id = filter_input(INPUT_GET, 'employee_id', FILTER_VALIDATE_INT);
if ($employee_id == null || $employee_id == false) {
    $employee_id = 1;
}

try{
// Get visit info for employee
$queryEmployee = 'SELECT * FROM employee';
$statement1 = $db->prepare($queryEmployee);
$statement1->execute();
$employees = $statement1;

$query2 = 'SELECT contact_id, contact.name, contact.email_address, contact.message, contact.contact_date
FROM contact
JOIN employee on contact.employee_id = employee.employee_id
WHERE employee.employee_id = :employee_id
ORDER BY contact_date';
$statement2 = $db->prepare($query2);
$statement2->bindValue(':employee_id', $employee_id);
$statement2->execute();
$contacts = $statement2;

} catch (PDOException $e){
    echo 'Error: ' . $e->getMessage();
}

} else if ($action == 'delete_contact') {
    $contact_id = filter_input(INPUT_POST, 'contact_id', FILTER_VALIDATE_INT);
    $query = 'DELETE FROM contact
WHERE contact_id = :contact_id';
    $statement = $db->prepare($query);
    $statement->bindValue(':contact_id', $contact_id);
    $statement->execute();
    $statement->closeCursor();
    header("Location: admin.php");
} 

?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="keywords" content="woodburned, art, unique, custom, small business, instagram">
        <meta name="description" content="One of a kind woodburned art pieces made by hand. Each piece as unique as you!" />
        <meta name="author" content="Deanna Brockert" />
        <title>Wood Burning by Amanda Mitchell</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="images/peace-fill.svg" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">woodoodles</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#details">Details</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#recent">Recent</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">Portfolio</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold">wood burned art<br> by<br> amanda mitchell</h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 font-weight-light mb-5">Unique art pieces made by hand.</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#contact">contact me</a>
                    </div>
                </div>
            </div>
        </header>

        <h1 class="container text-center">Admin</h1>
        <h3>Select an employee to view messages</h3>
        <aside>
            <ul style="list-style-type: none">
                <?php foreach ($employees as $employee) : ?>
                <li>
                    <a href="?employee_id=<?php echo $employee['employee_id'];?>">
                        <?php echo $employee['first_name'] . ' ' . $employee['last_name']?>
                    </a>
                </li>
                <?php endforeach; ?>
            </ul>
        </aside>
        
        <table>
            <tr>
                <th>Name</th>
                <th>Email Address</th>
                <th>Message</th>
                <th>Date</th>
                <th></th>
            </tr>
            <?php foreach($contacts as $contact) : ?>
            <tr>
                <td><?php echo $contact['name']; ?></td>
                <td><?php echo $contact['email_address']; ?></td>
                <td><?php echo $contact['message']; ?></td>
                <td><?php echo $contact['contact_date']; ?></td>
                <td>
                    <form action="admin.php" method="post">
                        <input type="hidden" name="action" value="delete_contact">
                        <input type="hidden" name="contact_id" 
                               value="<?php echo $contact['contact_id']; ?>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>

        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container"><div class="small text-center text-muted">Copyright © 2020 - Deanna Brockert</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
