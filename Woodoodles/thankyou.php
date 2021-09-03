<?php
    
    $name = filter_input(INPUT_POST, 'name');
    $email = filter_input(INPUT_POST, 'email');
    $message = filter_input(INPUT_POST, 'message');
    /* echo "Fields: " . $visitor_name . $visitor_email . $visitor_msg;  */
    
    // Validate inputs
    if ($name == null || $email == null || $message == null) {
        $error = "Invalid input data. Check all fields and try again.";
        /* include('error.php'); */
        echo "Form Data Error: " . $error; 
        exit();
        } else {
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

        <h2>Thank you, <?php echo $name; ?>, for contacting me! I will get back to you shortly.</h2>
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
