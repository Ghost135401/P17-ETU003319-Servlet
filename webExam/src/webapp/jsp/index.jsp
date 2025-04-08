<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Connexion</title>

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
    <h2 class="text-center mb-4">Connexion</h2>

    <form action="/ETU003319/CheckLogin" method="POST">
      <div class="mb-3">
        <label for="email" class="form-label">Votre Nom</label>
        <input type="text" class="form-control" id="email" placeholder="Entrez votre nom" name="nom" value="admin" required />
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <div class="input-group">
          <input type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe" name="pwd" value="admin" required />
          <span class="input-group-text">
            <i class="fa-solid fa-eye" id="togglePassword" style="cursor: pointer;"></i>
          </span>
        </div>
      </div>

      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="rememberMe"/>
        <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
      </div>

      <button type="submit" class="btn btn-primary w-100">Se connecter</button>
    </form>

    <div class="text-center mt-3">
      <a href="#">Mot de passe oublié ?</a>
    </div>
    <div class="text-center mt-2">
      <span>Pas de compte ?</span> <a href="#">S'inscrire</a>
      identifiant:admin
      mot de passe:admin
      ILAY RESTE NY AHY RAMOSE LASA REHEFA MAPIDITRA DEPENSE NO MIPOTRA FA TSY DASHBOARD
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
