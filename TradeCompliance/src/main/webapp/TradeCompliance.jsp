<!DOCTYPE html>
<html>
<head>
  <title>Worldly Wonders</title>
  <style>
    body {
      background-color: #f5f5f5;
      font-family: Arial, sans-serif;
    }

    h1 {
      text-align: center;
      margin-top: 50px;
      font-size: 50px;
      font-weight: bold;
      color: #333;
    }

    .form-container {
      max-width: 600px;
      margin: 0 auto;
      text-align: center;
    }

    form {
      background-color: #fff;
      padding: 40px;
      box-shadow: 0 0 10px #ddd;
      border-radius: 10px;
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 20px;
      font-size: 18px;
      margin-bottom: 20px;
      border: none;
      border-bottom: 2px solid #ddd;
      border-radius: 5px;
      transition: all 0.3s;
    }

    input[type="text"]:focus,
    select:focus {
      border-bottom: 2px solid #ff5733;
    }

    label {
      font-weight: bold;
      margin-bottom: 10px;
      display: block;
    }

    button[type="submit"] {
      width: 100%;
      padding: 20px;
      background-color: #ff5733;
      color: #fff;
      border: none;
      border-radius: 30px;
      font-size: 18px;
      font-weight: bold;
      transition: all 0.3s;
    }

    button[type="submit"]:hover {
      background-color: #fff;
      color: #ff5733;
      box-shadow: 0 0 10px #ff5733;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h1>Trade compliance</h1>
    <form action="TradeComplianceResultist" method="POST">
      <label for="product-title">Product Title</label>
      <input type="text" id="product-title" name="product-title" required>
      <label for="country">Country</label>
        <select id="country" name="country" required>
          <option value="Albania">Albania</option>
          <option value="Andorra">Andorra</option>
          <option value="Austria">Austria</option>
          <option value="Belgium">Belgium</option>
          <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
          <option value="Bulgaria">Bulgaria</option>
          <option value="Canada">Canada</option>
          <option value="Croatia">Croatia</option>
          <option value="Cyprus">Cyprus</option>
          <option value="Czech Republic">Czech Republic</option>
          <option value="Denmark">Denmark</option>
          <option value="Estonia">Estonia</option>
          <option value="Finland">Finland</option>
          <option value="France">France</option>
          <option value="Germany">Germany</option>
          <option value="Greece">Greece</option>
          <option value="Hungary">Hungary</option>
          <option value="Iceland">Iceland</option>
          <option value="Ireland">Ireland</option>
          <option value="Italy">Italy</option>
          <option value="Latvia">Latvia</option>
          <option value="Liechtenstein">Liechtenstein</option>
          <option value="Lithuania">Lithuania</option>
          <option value="Luxembourg">Luxembourg</option>
          <option value="Malta">Malta</option>
          <option value="Monaco">Monaco</option>
          <option value="Montenegro">Montenegro</option>
          <option value="Netherlands">Netherlands</option>
          <option value="Norway">Norway</option>
          <option value="Poland">Poland</option>
          <option value="Portugal">Portugal</option>
          <option value="Romania">Romania</option>
          <option value="San Marino">San Marino</option>
          <option value="Serbia">Serbia</option>
          <option value="Slovakia">Slovakia</option>
          <option value="Slovenia">Slovenia</option>
          <option value="Spain">Spain</option>
          <option value="Sweden">Sweden</option>
          <option value="Switzerland">Switzerland</option>
          <option value="United Kingdom">United Kingdom</option>
          <option value="United States of America">United States of America</option>
        </select>
      <button type="submit">Check for Restrictions</button>
    </form>
  </div>
</body>
</html>
