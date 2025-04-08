<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<% List<Depense> depenses = (List<Depense>) request.getAttribute("depense"); %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ligne de Depense</title>

 

</head>
<body>

 
    <h2 class="text-center mb-4">Liste Depense</h2>


     
    <table border="1">
        <tr>
            <td>Libelle</option>
            <td>Montant</option>
            <td>DateDebut</option>
            <td>DateFin</option>
        </tr>
          <% for (Depense depense : depenses) { %>
            <tr>
                <td><%= depense.getLibelle() %></option>
                <td><%= depense.getMontant() %></option>
                <td><%= depense.getDateDebut() %></option>
                <td><%= depense.getDateFin() %></option>
            </tr>
         
            <% } %>
        </table>
    
      </div>

     

      
</body>
</html>
