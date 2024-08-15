document.addEventListener('DOMContentLoaded', function () {
    fetch('fetch_books.php')
        .then(response => response.json())
        .then(data => {
            const bookList = document.getElementById('book-list');
            data.forEach(book => {
                const bookDiv = document.createElement('div');
                bookDiv.classList.add('book');
                
                const coverImage = document.createElement('img');
                coverImage.src = `images/${book.cover_image}`;
                coverImage.alt = book.title;

                const bookDetails = document.createElement('div');
                bookDetails.classList.add('book-details');
                
                const title = document.createElement('h3');
                title.textContent = book.title;

                const author = document.createElement('p');
                author.textContent = `by ${book.author}`;

                const genre = document.createElement('p');
                genre.textContent = `Genre: ${book.genre}`;

                const rating = document.createElement('p');
                rating.textContent = `Rating: ${book.rating}`;

                const description = document.createElement('p');
                description.textContent = book.description;

                bookDetails.appendChild(title);
                bookDetails.appendChild(author);
                bookDetails.appendChild(genre);
                bookDetails.appendChild(rating);
                bookDetails.appendChild(description);
                bookDiv.appendChild(coverImage);
                bookDiv.appendChild(bookDetails);
                bookList.appendChild(bookDiv);
            });
        });
});
