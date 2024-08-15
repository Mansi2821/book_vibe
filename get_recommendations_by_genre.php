<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "book_recommendations";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$genre = $_GET['genre'];

$sql = "SELECT * FROM books WHERE genre = '$genre'";
$book_result = $conn->query($sql);

if ($book_result->num_rows > 0) {
    while($row = $book_result->fetch_assoc()) {
        echo "<div class='book'>";
        echo "<img src='images/" . $row['cover_image'] . "' alt='Book Cover'>";
        echo "<div class='book-details'>";
        echo "<h3>" . $row['title'] . "</h3>";
        echo "<p>Author: " . $row['author'] . "</p>";
        echo "<p>Genre: " . $row['genre'] . "</p>";
        echo "<p>" . $row['description'] . "</p>";
        echo "<p>Rating: " . $row['rating'] . "/5</p>";
        echo "</div>";
        echo "</div>";
    }
} else {
    echo "<p>No books found for the selected genre.</p>";
}

$conn->close();
?>
