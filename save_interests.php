<?php
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

// Collect user inputs from the form
$user_id = $_POST['user_id'];
$favorite_genre = $_POST['favorite_genre'];
$favorite_author = $_POST['favorite_author'];
$reading_frequency = $_POST['reading_frequency'];
$preferred_language = $_POST['preferred_language'];

// SQL query to insert data into user_interests table
$sql = "INSERT INTO user_interests (favorite_genre, favorite_author, reading_frequency, preferred_language, user_id) 
        VALUES ('$favorite_genre', '$favorite_author', '$reading_frequency', '$preferred_language', '$user_id')";

// Execute the query
if ($conn->query($sql) === TRUE) {
    echo "Your interests have been saved successfully!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close the connection
$conn->close();
?>

