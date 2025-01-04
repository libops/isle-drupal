<?php

$libops_ruri = empty($_SERVER['REQUEST_URI']) ? "" : trim($_SERVER['REQUEST_URI'], " /");
if ($libops_ruri == 'ping') {
  echo "OK";
  http_response_code(200);
  exit;
}

if ($libops_ruri == 'healthcheck') {
  $servername = "mariadb";
  $database = "drupal_default";
  $username = "drupal_default";
  $password = getenv('DRUPAL_DEFAULT_DB_PASSWORD');
  try {
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
    $query = "SELECT id FROM users LIMIT 1";
    $stmt = $conn->query($query);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "OK";
    http_response_code(200);
  } catch (PDOException $e) {
    echo "Mariadb connection failed.";
    http_response_code(500);
  }
  exit;
}
