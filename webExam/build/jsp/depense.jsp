<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<% List<Credit> credits = (List<Credit>) request.getAttribute("credit"); %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ligne de Credit</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />

  <style>
    body {
      background: linear-gradient(135deg, #74ebd5, #ACB6E5);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .card {
      background-color: white;
      border-radius: 20px;
      padding: 2rem;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }

    input::placeholder {
      color: #adb5bd;
    }

    a {
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="card">
    <h2 class="text-center mb-4">Ajouter Ligne de Depense</h2>

    <form action="/ETU003319/dep" method="POST">
      <div class="mb-3">
        <label for="email" class="form-label">Entrez Libele</label>
        <select name="libelle" id="">
          <% for (Credit credit : credits) { %>
            <option value="<%= credit.getLibelle() %>"><%= credit.getLibelle() %></option>
         
            <% } %>
            
        </select>
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Entrez Montant</label>
        <div class="input-group">
          <input type="number" class="form-control" id="password" placeholder="Ex:Ar 100.000" name="montant" required />
          <span class="input-group-text">
            <i class="fa-solid fa-eye" id="togglePassword" style="cursor: pointer;"></i>
          </span>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Date Debut</label>
            <div class="input-group">
              <input type="Date" class="form-control" id="password" name="DateDebut" required />
            </div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Date Fin</label>
        <div class="input-group">
          <input type="Date" class="form-control" id="password" name="DateFin" required />
       
        </div>
  </div>

      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="rememberMe"/>
        <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
      </div>

      <button type="submit" class="btn btn-primary w-100">Ajouter Depense</button>
    </form>

    <div class="text-center mt-3">
      <a href="/ETU003319/dep">ajouter ligne depense</a>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    document.getElementById("togglePassword").addEventListener("click", function () {
      const passwordField = document.getElementById("password");
      const type = passwordField.getAttribute("type") === "password" ? "text" : "password";
      passwordField.setAttribute("type", type);

      this.classList.toggle("fa-eye");
      this.classList.toggle("fa-eye-slash");
    });
  </script>

</body>
</html>
