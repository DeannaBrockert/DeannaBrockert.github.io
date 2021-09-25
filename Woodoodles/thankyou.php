<?php
/* * ****************************************************************** 
 * Date         Name          Description
 * ---------------------------------------
 * 9/3/21      Deanna B       Initial depolyment of thank you page. 
 * 9/17/21     Deanna B       Use database class and visit functions. 
 * 
 * ******************************************************************* */

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

    require_once('./model/database.php');
    require_once('./model/contact.php');
    addContact($name, $email, $message);
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
                <a class="navbar-brand js-scroll-trigger" href="index.html">woodoodles</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.html">About</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.html">Details</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.html">Recent</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.html">Portfolio</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.html">Contact</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="admin.php">Admin</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="listemployees.php">Employees</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <!--        <header class="masthead">
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
                </header>-->

        <section class="page-section bg-primary" id="about">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">Message sent!</h2>
                        <hr class="divider light my-4" />
                        <p class="text-white mb-4">Thank you, <?php echo $name; ?>, for contacting me! I will get back to you shortly.</p>
                    </div>
                </div>
            </div>
        </section>
        
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
