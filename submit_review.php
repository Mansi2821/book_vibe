<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "book_recommendations";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$review = $_POST['review'];
$rating = $_POST['rating'];

$sql = "INSERT INTO reviews (review, rating) VALUES ('$review', '$rating')";

if ($conn->query($sql) === TRUE) {
    echo "Thank you for your review!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
