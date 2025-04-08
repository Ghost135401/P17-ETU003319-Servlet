<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<% List<Credit> credits = (List<Credit>) request.getAttribute("credit"); %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ligne de Credit</title>

 

</head>
<body>

 
    <h2 class="text-center mb-4">Liste Credit</h2>


     
    <table border="1">
        <tr>
            <td>Libelle</option>
            <td>Montant</option>
            <td>DateDebut</option>
            <td>DateFin</option>
        </tr>
          <% for (Credit credit : credits) { %>
            <tr>
                <td><%= credit.getLibelle() %></option>
                <td><%= credit.getMontant() %></option>
                <td><%= credit.getDateDebut() %></option>
                <td><%= credit.getDateFin() %></option>
            </tr>
         
            <% } %>
        </table>
    
      </div>

     

      
</body>
</html>
