<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "book_recommendations";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$user_id = 1; // Replace with the actual logged-in user's ID
$sql = "SELECT favorite_genre FROM user_interests WHERE user_id = $user_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $user_interests = $result->fetch_assoc();
    $favorite_genre = $user_interests['favorite_genre'];

    $sql = "SELECT * FROM books WHERE genre = '$favorite_genre'";
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
        echo "<p>No recommendations found for your favorite genre.</p>";
    }
} else {
    echo "<p>No user interests found.</p>";
}

$conn->close();
?>
