<%-- 
    Document   : menambahgame
    Created on : 21 Nov 2024, 16.34.32
    Author     : Victus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menambah Game</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #002b40;
      color: white;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
      overflow-y: auto;
      padding: 20px;
      box-sizing: border-box;
    }

    .container {
      width: 90%;
      max-width: 900px;
      background-color: #1c3b4d;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
      position: relative;
    }

    h1 {
      text-align: center;
      font-size: 2.5rem;
      margin-bottom: 30px;
      color: white;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-size: 1rem;
      margin-bottom: 5px;
    }

    input, textarea {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 5px;
      outline: none;
      font-size: 1rem;
      background-color: #749aa8;
      color: white;
    }

    input[type="file"] {
      display: flex;
      align-items: center;
      padding: 10px;
      font-size: 1rem;
      cursor: pointer;
    }

    .upload-container {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    button {
      background-color: #28a745;
      color: white;
      font-size: 1rem;
      font-weight: bold;
      padding: 12px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease;
      align-self: center;
      width: 200px;
    }

    button:hover {
      background-color: #218838;
      transform: scale(1.05);
    }

    .back-button {
      position: fixed;
      bottom: 20px;
      left: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #749aa8;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      color: white;
      font-size: 1.5rem;
      text-align: center;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .back-button:hover {
      background-color: #5c8a99;
      transform: scale(1.1);
    }

    /* Notification styling */
    .notification {
      display: none;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #28a745;
      color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      font-size: 1.2rem;
      text-align: center;
      z-index: 10;
    }

    .notification.show {
      display: block;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Menambah Game</h1>
    <form id="gameForm">
      <label for="name">Nama:</label>
      <input type="text" id="name" name="name" placeholder="Masukkan nama game" required>

      <label for="genre">Genre:</label>
      <input type="text" id="genre" name="genre" placeholder="Masukkan genre game" required>

      <label for="device">Device:</label>
      <input type="text" id="device" name="device" placeholder="Masukkan perangkat game" required>

      <label for="price">Harga:</label>
      <input type="text" id="price" name="price" placeholder="Masukkan harga game" required>

      <label for="age">Umur:</label>
      <input type="text" id="age" name="age" placeholder="Batas umur game" required>

      <label for="description">Deskripsi:</label>
      <textarea id="description" name="description" rows="4" placeholder="Masukkan deskripsi game" required></textarea>

      <div class="upload-container">
        <label for="image">Upload Foto:</label>
        <input type="file" id="image" name="image" accept="image/*" required>
      </div>

      <button type="submit">Tambahkan</button>
    </form>
    <div class="notification" id="notification">
      Penambahan Berhasil!
    </div>
  </div>

  <a href="/admin-menu" class="back-button">&#8630;</a>

  <script>
    // Get the form and notification elements
    const form = document.getElementById('gameForm');
    const notification = document.getElementById('notification');

    // Add an event listener to the form
    form.addEventListener('submit', function(event) {
      event.preventDefault(); // Prevent actual form submission

      // Show the notification
      notification.classList.add('show');

      // Hide the notification after 3 seconds
      setTimeout(() => {
        notification.classList.remove('show');
      }, 3000);

      // Optionally, clear the form fields
      form.reset();
    });
  </script>
</body>
</html>


