<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "book_recommendations";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$title = $_POST['title'];
$author = $_POST['author'];
$genre = $_POST['genre'];
$description = $_POST['description'];
$rating = $_POST['rating'];

// Handle file upload
$target_dir = "images/";
$target_file = $target_dir . basename($_FILES["cover_image"]["name"]);
move_uploaded_file($_FILES["cover_image"]["tmp_name"], $target_file);
$cover_image = basename($_FILES["cover_image"]["name"]);

$sql = "INSERT INTO books (title, author, genre, description, rating, cover_image) VALUES ('$title', '$author', '$genre', '$description', '$rating', '$cover_image')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
header('Location: index.html');
?>
