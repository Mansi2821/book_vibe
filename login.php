<?php
session_start(); // Start a session

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "book_recommendations";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    // Hash the password before storing it
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Prepare and bind
    $stmt = $conn->prepare("SELECT id, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);

    // Execute the statement
    $stmt->execute();

    // Bind result variables
    $stmt->bind_result($user_id, $hashed_password);

    // Fetch the result
    if ($stmt->fetch()) {
        // Verify the password
        if (password_verify($password, $hashed_password)) {
            // Password is correct, set the session and redirect
            $_SESSION['user_id'] = $user_id;
            $_SESSION['username'] = $username;

            // Redirect to the interests page or wherever appropriate
            header("Location: interests.html");
            exit();
        } else {
            // Invalid password
            echo "Invalid username or password.";
        }
    } else {
        // No such user found
        echo "Invalid username or password.";
    }

    // Close statement
    $stmt->close();
}

// Close connection
$conn->close();
?>
