<%-- 
    Document   : homepage
    Created on : 20 Nov 2024, 20.17.47
    Author     : Victus
    ok
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Game"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GameRecce - Sorting Games</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #002b40;
      color: white;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
      min-height: 100vh;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 90%;
      max-width: 1200px;
      padding: 20px 0;
      border-bottom: 2px solid #749aa8;
    }

    .header .logo {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .header .logo img {
      width: 50px;
      height: 50px;
    }

    .header h2 {
      font-size: 1.8rem;
      font-weight: bold;
      color: #8bc8bd;
      margin: 0;
    }

    .header .search {
      background-color: #0056b3;
      width: 45px;
      height: 45px;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
    }

    .header .search img {
      width: 25px;
      height: 25px;
    }

    .main-content {
      width: 90%;
      max-width: 1200px;
      margin-top: 30px;
    }

    .sort-button {
      background-color: #28a745;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1rem;
      font-weight: bold;
      transition: background-color 0.3s ease, transform 0.2s ease;
      display: inline-block;
      margin-bottom: 20px;
    }

    .sort-button:hover {
      background-color: #218838;
      transform: translateY(-2px);
    }

    .game-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 20px;
      padding-bottom: 20px;
    }

    .game-card {
      background-color: #1c3b4d;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      text-align: center;
    }

    .game-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
    }

    .game-card img {
      width: 100%;
      height: 160px;
      object-fit: cover;
    }

    .game-card-title {
      padding: 15px;
      font-size: 1.1rem;
      font-weight: bold;
      color: white;
    }

    footer {
      margin-top: 20px;
      padding: 10px;
      text-align: center;
      background-color: #00334d;
      width: 100%;
      color: white;
      font-size: 0.9rem;
      border-top: 2px solid #749aa8;
    }

    footer a {
      color: #8bc8bd;
      text-decoration: none;
    }

    footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
    <%  List<Game>games=(List<Game>)request.getSession().getAttribute("games");   
        List<Game>filteredGame=(List<Game>)request.getSession().getAttribute("filteredGame");
        List<Game>sortedGame=(List<Game>)request.getSession().getAttribute("sortedGame");
        List<Game>displayGame=new ArrayList<>();
        if(filteredGame!=null){
           displayGame=filteredGame;
           
           if(sortedGame!=null){
            displayGame=sortedGame;
        }
           
        }else{
        
           displayGame=games;
           
           if(sortedGame!=null){
            displayGame=sortedGame;
        }
        }
    
    
    
    %>
  <div class="header">
    <div class="logo">
      <img src="https://via.placeholder.com/50" alt="GameRecce Logo">
      <h2>GameRecce</h2>
    </div>
      <form action="/Game" method="get">
          <input type="hidden" name="action" value="searchGame">
          <input type="text" name="query" placeholder="Search...">
          <button type="submit" class="search-btn"><img src="https://via.placeholder.com/25" alt="Search Icon"></button>
    </form>
    
  </div>
  <div class="main-content">
    <button onclick="window.location.href='/Game?action=sortGame'">Sort Game</button>
    <div class="game-grid">
         <% if (!games.isEmpty()) { %>
    <% for (Game game : displayGame) { %>
    <a href="/Game?action=displaySingleGame&id=<%=game.getGameID()%>" >  
    <div class="game-card">
          <img src="<%=game.getPosterGame()%>" alt="Game Image">
          <div class="game-card-title"><%=game.getName()%></div>
      </div>
    </a>
    <% } %>
<% } else { %>
    <p>No games available to display.</p>
<% } %>
      
      
 
    </div>
  </div>
  <footer>
    &copy; 2024 GameRecce. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
  </footer>
</body>
</html>


