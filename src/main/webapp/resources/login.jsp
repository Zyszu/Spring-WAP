<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<header class="navbar">
  <div class="logo">User Login</div>
  <div class="language">
    <a href="?lang=en">EN</a> | <a href="?lang=es">ES</a> | <a href="?lang=pl">PL</a>
  </div>
</header>

<main class="container">
  <h2>Login</h2>

  <form action="login" method="post" class="user-form">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" class="input-field" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" class="input-field" required>

    <button type="submit" class="btn primary">Login</button>

    <p class="forgot-password">
      <a href="forgot-password">Forgot your password?</a>
    </p>
  </form>
</main>

</body>
</html>
